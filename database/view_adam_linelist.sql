-- DROP VIEW "public"."linelist_adam";

-- CREATE VIEW linelist_adam AS

SELECT
    -- Outbreak and Syndrome
    T1.doc->>'outbreak_code' as case_outbreak,
    T1.doc->'cases_group'->'outbreak_location'->'outbreak'->>'code' as case_syndrome_code,
    T5.syndrome_name as case_syndrome_name,
    
    -- Case identifier
    T1.doc->>'patient_id' as case_id,
    T1.doc->'case_identifiers'->>'case_is_contact' as case_is_contact,
    T1.doc->>'name' as case_name,
    
    -- Biodata
    T7.sex_name as case_sex,
    T6.occupation_name as case_occupation,
    CAST((case when (T1.doc -> 'case_demographics' -> 'ephemeral_dob' ->> 'dob_method') = 'yes' then (T1.doc -> 'case_demographics' ->> 'date_of_birth') else (T1.doc -> 'case_demographics' -> 'ephemeral_dob' ->> 'dob_approx') end) as DATE) as case_date_of_birth,    
    T4.ag_label as case_age_group,
    
    -- Residence
    T1.doc->'case_location'->>'case_county' as case_county,
    T1.doc->'case_location'->>'case_subcounty' as case_sub_county,
    
    -- Outcome and status
    T2.doc->'fields'->'co_final'->>'cof_case_classification' as case_outcome,
    T2.doc->'fields'->'co_final'->>'cof_patient_status' as case_status,
    T2.doc->'fields'->'co_final'->'cof_date' as case_outcome_date,
    CAST(T1.doc->'meta'->>'case_investigation_date' as DATE) as case_investigation_date,
    
    -- Geolocation
    T2.doc->'geolocation_log'->0->'recording'->>'latitude' as case_latitude,
    T2.doc->'geolocation_log'->0->'recording'->>'longitude' as case_longitude,
    
    -- Raw data
    T1.doc as doc_case,
    T2.doc as doc_case_outcome,
    T3.doc as doc_case_clinical_information

FROM
    "public"."couchdb" T1
    LEFT JOIN "public"."couchdb" T2 ON (T1.doc->>'_id' = T2.doc->'fields'->'inputs'->'contact'->>'_id' AND T2.doc->>'form' = 'case_outcome')
    LEFT JOIN "public"."couchdb" T3 ON (T1.doc->>'_id' = T3.doc->'fields'->'inputs'->'contact'->>'_id' AND T3.doc->>'form' = 'case_clinical_information')
    LEFT JOIN "public"."dim_age_group" T4 ON (date_part('year', age(CAST(CAST((case when (T1.doc->'case_demographics'->'ephemeral_dob'->>'dob_method') = 'yes' then (T1.doc->'case_demographics'->'date_of_birth') else (T1.doc->'case_demographics'->'ephemeral_dob'->'dob_approx') end) as varchar) as DATE))) BETWEEN "ag_floor" AND "ag_ceiling")
    LEFT JOIN "public"."dim_syndromes" T5 ON (T5.syndrome_code = T1.doc->'cases_group'->'outbreak_location'->'outbreak'->>'code')
    LEFT JOIN "public"."dim_occupation" T6 ON (T6.occupation_code = T1.doc->'case_demographics_extended'->>'case_occupation')
    LEFT JOIN "public"."dim_sex" T7 ON (T7.sex_code = T1.doc->'case_demographics'->>'case_sex')
    
WHERE 
    T1.doc->>'contact_type' = 'case'