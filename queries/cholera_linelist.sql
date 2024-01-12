SELECT
    T1.doc->'patient_id' as case_id,
    T3.doc->'fields'->'cci_created'->'created_on' as case_investigation_date,
    T1.doc->'name' as case_name,
    T1.doc->'case_demographics'->'case_sex' as case_sex,
    T1.doc->'case_location'->'case_county' as case_county,
    T1.doc->'case_location'->'case_subcounty' as case_sub_county,
    T3.doc->'fields'->'cholera_screening'->'cholera_symptoms' as case_symptoms,
    T2.doc->'fields'->'co_final'->'cof_case_classification' as case_outcome,
    T2.doc->'fields'->'co_final'->'cof_date' as case_outcome_date

FROM
    "public"."couchdb" T1
    LEFT JOIN "public"."couchdb" T2 ON T1.doc->>'_id' = T2.doc->'fields'->'inputs'->'contact'->>'_id'
    LEFT JOIN "public"."couchdb" T3 ON T1.doc->>'_id' = T3.doc->'fields'->'inputs'->'contact'->>'_id'
    
WHERE 
    T1.doc->>'contact_type' = 'case'  AND 
    T1.doc->'cases_group'->'outbreak_location'->'outbreak'->>'code' = 'cholera' AND
    T2.doc->>'form' = 'case_outcome' AND 
    T3.doc->>'form' = 'case_clinical_information'