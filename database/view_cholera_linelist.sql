DROP VIEW "public"."linelist_cholera";

CREATE VIEW linelist_cholera AS

SELECT
    -- Outbreak and Syndrome
    T1.doc->>'outbreak_code' as case_outbreak,
    T1.doc->'cases_group'->'outbreak_location'->'outbreak'->>'code' as case_syndrome_code,
    T5.syndrome_name as case_syndrome_name,
    
    -- Case identifier
    T1.doc->>'patient_id' as case_id,
    T1.doc->'case_identifiers'->>'case_is_contact' as case_is_contact,
    T1.doc->>'name' as case_name,
    T1.doc->>'phone' as case_phone_number,
    
    -- Biodata
    T7.sex_name as case_sex,
    T6.occupation_name as case_occupation,
    CAST((case when (T1.doc -> 'case_demographics' -> 'ephemeral_dob' ->> 'dob_method') = 'yes' then (T1.doc -> 'case_demographics' ->> 'date_of_birth') else (T1.doc -> 'case_demographics' -> 'ephemeral_dob' ->> 'dob_approx') end) as DATE) as case_date_of_birth,
    CAST(date_part('year', age(CAST((case when (T1.doc -> 'case_demographics' -> 'ephemeral_dob' ->> 'dob_method') = 'yes' then (T1.doc -> 'case_demographics' ->> 'date_of_birth') else (T1.doc -> 'case_demographics' -> 'ephemeral_dob' ->> 'dob_approx') end) as DATE))) as varchar) as case_age,
    T4.ag_label as case_age_group,
    
    -- Residence
    T1.doc->'case_location'->>'case_country' as case_country,
    T1.doc->'case_location'->>'case_county' as case_county,
    T1.doc->'case_location'->>'case_subcounty' as case_sub_county,
    
    -- Reporting location
    TOutbreakLocation.doc->'outbreak'->>'county' as case_reporting_county,
    TOutbreakLocation.doc->'outbreak'->>'subcounty' as case_reporting_subcounty,
    
    -- Vaccination
    T3.doc->'fields'->'cholera_screening'->>'cholera_vaccination' as case_vaccinated,
    TVaccination.doc->'fields'->'case_vaccination'->>'cv_dose_number' as case_vaccination_doses,
    
    -- Hospitalization
    T3.doc->'fields'->'cholera_screening'->>'cholera_hospitalization' as case_hospitalized,
    THospitalization.doc->'fields'->'ch_location'->>'chl_facility' as case_hospitalization_facility_name,
    THospitalization.doc->'fields'->'ch_admission'->>'cha_visit_date' as case_hospitalization_visit_date,
    THospitalization.doc->'fields'->'cht_cholera'->>'cht_cholera_treatment_label' as case_hospitalization_treatment,
    
    -- Outcome and status
    T8.outcome_label as case_outcome,
    T2.doc->'fields'->'co_final'->>'cof_patient_status' as case_status,
    T2.doc->'fields'->'co_final'->'cof_date' as case_outcome_date,
    CAST(T1.doc->'meta'->>'case_investigation_date' as DATE) as case_investigation_date,
    to_char(CAST(T1.doc->'meta'->>'case_investigation_date' as DATE), 'YYYY') as case_investigation_year,
    to_char(CAST(T1.doc->'meta'->>'case_investigation_date' as DATE), 'MM') as case_investigation_month,
    
    -- Geolocation
    T2.doc->'geolocation_log'->0->'recording'->>'latitude' as case_latitude,
    T2.doc->'geolocation_log'->0->'recording'->>'longitude' as case_longitude,
    
    -- Raw data
    T1.doc as doc_case,
    T2.doc as doc_case_outcome,
    T3.doc as doc_case_clinical_information,
    -- TVaccination.doc as doc_case_vaccination,
    -- THospitalization.doc as doc_case_hospitalization
    TOutbreakLocation.doc as doc_outbreak

FROM
    "public"."couchdb" T1
    LEFT JOIN "public"."couchdb" TVaccination ON (T1.doc->>'_id' = TVaccination.doc->'fields'->'inputs'->'contact'->>'_id' AND TVaccination.doc->>'form' = 'case_vaccination')
    LEFT JOIN "public"."couchdb" THospitalization ON (T1.doc->>'_id' = THospitalization.doc->'fields'->'inputs'->'contact'->>'_id' AND THospitalization.doc->>'form' = 'case_hospitalization')
    LEFT JOIN "public"."couchdb" T2 ON (T1.doc->>'_id' = T2.doc->'fields'->'inputs'->'contact'->>'_id' AND T2.doc->>'form' = 'case_outcome')
    LEFT JOIN "public"."couchdb" T3 ON (T1.doc->>'_id' = T3.doc->'fields'->'inputs'->'contact'->>'_id' AND T3.doc->>'form' = 'case_clinical_information')
    LEFT JOIN "public"."dim_age_group" T4 ON (date_part('year', age(CAST(CAST((case when (T1.doc->'case_demographics'->'ephemeral_dob'->>'dob_method') = 'yes' then (T1.doc->'case_demographics'->'date_of_birth') else (T1.doc->'case_demographics'->'ephemeral_dob'->'dob_approx') end) as varchar) as DATE))) BETWEEN "ag_floor" AND "ag_ceiling")
    LEFT JOIN "public"."dim_syndromes" T5 ON (T5.syndrome_code = T1.doc->'cases_group'->'outbreak_location'->'outbreak'->>'code')
    LEFT JOIN "public"."dim_occupation" T6 ON (T6.occupation_code = T1.doc->'case_demographics_extended'->>'case_occupation')
    LEFT JOIN "public"."dim_sex" T7 ON (T7.sex_code = T1.doc->'case_demographics'->>'case_sex')
    LEFT JOIN "public"."dim_case_outcome" T8 ON (T8.outcome_code = T2.doc->'fields'->'co_final'->>'cof_case_classification')
    LEFT JOIN "public"."couchdb" TOutbreakLocation ON (T1.doc->'parent'->'parent'->>'_id' = TOutbreakLocation.doc->>'_id' AND TOutbreakLocation.doc->>'type' = 'contact')
    
WHERE 
    T1.doc->>'contact_type' = 'case' 
    AND T1.doc->'cases_group'->'outbreak_location'->'outbreak'->>'disease' = 'cholera'