-- A: Create a master key.
-- Only necessary if one does not already exist.
-- Required to encrypt the credential secret in the next step.

CREATE MASTER KEY;


-- B: Create a database scoped credential
-- IDENTITY: Provide any varchar(256), it is not used for authentication to Azure storage.
-- SECRET: Provide your Azure storage account key.


CREATE DATABASE SCOPED CREDENTIAL AzureStorageCredential
WITH
    IDENTITY = 'scott',
    SECRET = '<put secret key from portal here - no secret keys on git!>'
;


-- C: Create an external data source
-- TYPE: HADOOP - PolyBase uses Hadoop APIs to access data in Azure blob storage.
-- LOCATION: Provide Azure storage account name and blob container name.
-- CREDENTIAL: Provide the credential created in the previous step.

CREATE EXTERNAL DATA SOURCE DataLakeStorage
WITH (
    TYPE = HADOOP,
    LOCATION = 'wasbs://datalake@datalakepocjsp.blob.core.windows.net',
    CREDENTIAL = AzureStorageCredential
);

/*CREATE EXTERNAL FILE FORMAT file_format_name  
WITH (  
    FORMAT_TYPE = ORC  
     [ , DATA_COMPRESSION = {  
        'org.apache.hadoop.io.compress.SnappyCodec'  
      | 'org.apache.hadoop.io.compress.DefaultCodec'      }  
    ]); 
	*/ 

DROP EXTERNAL FILE FORMAT ORC_Files;
CREATE EXTERNAL FILE FORMAT ORC_Files  
WITH (  
    FORMAT_TYPE = ORC  
    , DATA_COMPRESSION = 'org.apache.hadoop.io.compress.DefaultCodec'   
    );  

CREATE SCHEMA hmda;

CREATE EXTERNAL TABLE hmda.hmda_lar(
  action_taken int,
  action_taken_name varchar(256),
  agency_code int,
  agency_abbr varchar(256),
  agency_name varchar(256),
  applicant_ethnicity int,
  applicant_ethnicity_name varchar(256),
  applicant_income_000s int,
  applicant_race_1 int,
  applicant_race_2 int,
  applicant_race_3 int,
  applicant_race_4 int,
  applicant_race_5 int,
  applicant_race_name_1 varchar(256),
  applicant_race_name_2 varchar(256),
  applicant_race_name_3 varchar(256),
  applicant_race_name_4 varchar(256),
  applicant_race_name_5 varchar(256),
  applicant_sex int,
  applicant_sex_name varchar(256),
  application_date_indicator int,
  census_tract_number varchar(256),
  co_applicant_ethnicity int,
  co_applicant_ethnicity_name int,
  co_applicant_race_1 int,
  co_applicant_race_2 int,
  co_applicant_race_3 int,
  co_applicant_race_4 int,
  co_applicant_race_5 int,
  co_applicant_race_name_1 varchar(256),
  co_applicant_race_name_2 varchar(256),
  co_applicant_race_name_3 varchar(256),
  co_applicant_race_name_4 varchar(256),
  co_applicant_race_name_5 varchar(256),
  co_applicant_sex int,
  co_applicant_sex_name varchar(256),
  county_code int,
  county_name varchar(256),
  denial_reason_1 int,
  denial_reason_2 int,
  denial_reason_3 int,
  denial_reason_name_1 varchar(256),
  denial_reason_name_2 varchar(256),
  denial_reason_name_3 varchar(256),
  edit_status int,
  edit_status_name varchar(256),
  hoepa_status int,
  hoepa_status_name varchar(256),
  lien_status int,
  lien_status_name varchar(256),
  loan_purpose int,
  loan_purpose_name varchar(256),
  loan_type int,
  loan_type_name varchar(256),
  msamd varchar(256),
  msamd_name varchar(256),
  owner_occupancy int,
  owner_occupancy_name varchar(256),
  preapproval int,
  preapproval_name varchar(256),
  property_type int,
  property_type_name varchar(256),
  purchaser_type int,
  purchaser_type_name varchar(256),
  respondent_id int,
  sequence_number varchar(256),
  state_code int,
  state_abbr varchar(256),
  state_name varchar(256),
  hud_median_family_income int,
  loan_amount_000s int,
  number_of_1_to_4_family_units int,
  number_of_owner_occupied_units int,
  minority_population decimal(5,2),
  population int,
  rate_spread decimal(5,2),
  tract_to_msamd_income decimal(10,2))
--PARTITIONED BY (
--as_of_year varchar(256))
WITH
(
    LOCATION='/feeds/hmda/hmda_lar/clean/orc/' 
,   DATA_SOURCE = DataLakeStorage
,   FILE_FORMAT = ORC_Files
,   REJECT_TYPE = VALUE
,   REJECT_VALUE = 0
);