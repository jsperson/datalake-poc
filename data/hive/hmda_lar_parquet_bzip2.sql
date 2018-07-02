
set hive.exec.dynamic.partition=true;
set hive.exec.dynamic.partition.mode=nonstrict;
set hive.mapred.mode=nonstrict;

INSERT OVERWRITE TABLE hmda.hmda_lar_parquet_bzip2 partition (as_of_year) 
SELECT  action_taken, 
  action_taken_name, 
  agency_code, 
  agency_abbr, 
  agency_name, 
  applicant_ethnicity, 
  applicant_ethnicity_name, 
  applicant_income_000s, 
  applicant_race_1, 
  applicant_race_2, 
  applicant_race_3, 
  applicant_race_4, 
  applicant_race_5, 
  applicant_race_name_1, 
  applicant_race_name_2, 
  applicant_race_name_3, 
  applicant_race_name_4, 
  applicant_race_name_5, 
  applicant_sex, 
  applicant_sex_name, 
  application_date_indicator, 
  census_tract_number, 
  co_applicant_ethnicity, 
  co_applicant_ethnicity_name, 
  co_applicant_race_1, 
  co_applicant_race_2, 
  co_applicant_race_3, 
  co_applicant_race_4, 
  co_applicant_race_5, 
  co_applicant_race_name_1, 
  co_applicant_race_name_2, 
  co_applicant_race_name_3, 
  co_applicant_race_name_4, 
  co_applicant_race_name_5, 
  co_applicant_sex, 
  co_applicant_sex_name, 
  county_code, 
  county_name, 
  denial_reason_1, 
  denial_reason_2, 
  denial_reason_3, 
  denial_reason_name_1, 
  denial_reason_name_2, 
  denial_reason_name_3, 
  edit_status, 
  edit_status_name, 
  hoepa_status, 
  hoepa_status_name, 
  lien_status, 
  lien_status_name, 
  loan_purpose, 
  loan_purpose_name, 
  loan_type, 
  loan_type_name, 
  msamd, 
  msamd_name, 
  owner_occupancy, 
  owner_occupancy_name, 
  preapproval, 
  preapproval_name, 
  property_type, 
  property_type_name, 
  purchaser_type, 
  purchaser_type_name, 
  respondent_id, 
  sequence_number, 
  state_code, 
  state_abbr, 
  state_name, 
  hud_median_family_income, 
  loan_amount_000s, 
  number_of_1_to_4_family_units, 
  number_of_owner_occupied_units, 
  minority_population, 
  population, 
  rate_spread, 
  tract_to_msamd_income,
  as_of_year
from hmda.hmda_lar_raw;

msck repair table hmda.hmda_lar_parquet_bzip2;
