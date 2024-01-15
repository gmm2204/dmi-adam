CREATE TABLE "public"."dim_syndromes" ( 
  "syndrome_code" VARCHAR(250) NULL,
  "syndrome_name" VARCHAR(250) NULL
);
CREATE TABLE "public"."dim_sex" ( 
  "sex_code" VARCHAR(250) NULL,
  "sex_name" VARCHAR(250) NULL
);
CREATE TABLE "public"."dim_occupation" ( 
  "occupation_code" VARCHAR(250) NULL,
  "occupation_name" VARCHAR(250) NULL
);
CREATE TABLE "public"."dim_age_group" ( 
  "ag_floor" INTEGER NULL,
  "ag_ceiling" INTEGER NULL,
  "ag_label" VARCHAR(250) NULL
);
ALTER TABLE "public"."dim_syndromes" DISABLE TRIGGER ALL;
ALTER TABLE "public"."dim_sex" DISABLE TRIGGER ALL;
ALTER TABLE "public"."dim_occupation" DISABLE TRIGGER ALL;
ALTER TABLE "public"."dim_age_group" DISABLE TRIGGER ALL;
INSERT INTO "public"."dim_syndromes" ("syndrome_code", "syndrome_name") VALUES ('unknown', 'Unknown Disease / Syndrome');
INSERT INTO "public"."dim_syndromes" ("syndrome_code", "syndrome_name") VALUES ('covid19', 'COVID-19');
INSERT INTO "public"."dim_syndromes" ("syndrome_code", "syndrome_name") VALUES ('dysentery', 'Acute Diarrheal Syndrome (Diarrheal Diseases-Dysentery)');
INSERT INTO "public"."dim_syndromes" ("syndrome_code", "syndrome_name") VALUES ('cholera', 'Cholera');
INSERT INTO "public"."dim_syndromes" ("syndrome_code", "syndrome_name") VALUES ('evd', 'Viral Haemorrhagic Fever (Ebola, Rift Valley Fever, Crimea - Congo HF)');
INSERT INTO "public"."dim_syndromes" ("syndrome_code", "syndrome_name") VALUES ('sari_ili', 'SARI/ILI');
INSERT INTO "public"."dim_syndromes" ("syndrome_code", "syndrome_name") VALUES ('measles', 'Measles');
INSERT INTO "public"."dim_sex" ("sex_code", "sex_name") VALUES ('female', 'Female');
INSERT INTO "public"."dim_sex" ("sex_code", "sex_name") VALUES ('male', 'Male');
INSERT INTO "public"."dim_occupation" ("occupation_code", "occupation_name") VALUES ('hcw', 'Health Care Worker');
INSERT INTO "public"."dim_occupation" ("occupation_code", "occupation_name") VALUES ('farmer', 'Farmer');
INSERT INTO "public"."dim_occupation" ("occupation_code", "occupation_name") VALUES ('trader', 'Business Person');
INSERT INTO "public"."dim_occupation" ("occupation_code", "occupation_name") VALUES ('student', 'Student');
INSERT INTO "public"."dim_occupation" ("occupation_code", "occupation_name") VALUES ('driver', 'Driver');
INSERT INTO "public"."dim_occupation" ("occupation_code", "occupation_name") VALUES ('none', 'Unemployed');
INSERT INTO "public"."dim_occupation" ("occupation_code", "occupation_name") VALUES ('other', 'Other');
INSERT INTO "public"."dim_occupation" ("occupation_code", "occupation_name") VALUES ('employee', 'Employed');
INSERT INTO "public"."dim_age_group" ("ag_floor", "ag_ceiling", "ag_label") VALUES (5, 14, '4 - 14 years');
INSERT INTO "public"."dim_age_group" ("ag_floor", "ag_ceiling", "ag_label") VALUES (15, 24, '15 - 24 years');
INSERT INTO "public"."dim_age_group" ("ag_floor", "ag_ceiling", "ag_label") VALUES (25, 34, '25 - 34 years');
INSERT INTO "public"."dim_age_group" ("ag_floor", "ag_ceiling", "ag_label") VALUES (35, 44, '35 - 44 years');
INSERT INTO "public"."dim_age_group" ("ag_floor", "ag_ceiling", "ag_label") VALUES (45, 54, '45 - 54 years');
INSERT INTO "public"."dim_age_group" ("ag_floor", "ag_ceiling", "ag_label") VALUES (55, 64, '55 - 64 years');
INSERT INTO "public"."dim_age_group" ("ag_floor", "ag_ceiling", "ag_label") VALUES (65, 74, '64 - 74 years');
INSERT INTO "public"."dim_age_group" ("ag_floor", "ag_ceiling", "ag_label") VALUES (75, 84, '75 - 85 years');
INSERT INTO "public"."dim_age_group" ("ag_floor", "ag_ceiling", "ag_label") VALUES (85, 150, '85+ years');
INSERT INTO "public"."dim_age_group" ("ag_floor", "ag_ceiling", "ag_label") VALUES (0, 4, '0 - 4 years');
ALTER TABLE "public"."dim_syndromes" ENABLE TRIGGER ALL;
ALTER TABLE "public"."dim_sex" ENABLE TRIGGER ALL;
ALTER TABLE "public"."dim_occupation" ENABLE TRIGGER ALL;
ALTER TABLE "public"."dim_age_group" ENABLE TRIGGER ALL;
CREATE VIEW "public"."linelist_adam"
AS
 SELECT (t1.doc ->> 'outbreak_code'::text) AS case_outbreak,
    ((((t1.doc -> 'cases_group'::text) -> 'outbreak_location'::text) -> 'outbreak'::text) ->> 'code'::text) AS case_syndrome_code,
    t5.syndrome_name AS case_syndrome_name,
    (t1.doc ->> 'patient_id'::text) AS case_id,
    ((t1.doc -> 'case_identifiers'::text) ->> 'case_is_contact'::text) AS case_is_contact,
    (t1.doc ->> 'name'::text) AS case_name,
    t7.sex_name AS case_sex,
    t6.occupation_name AS case_occupation,
    (
        CASE
            WHEN ((((t1.doc -> 'case_demographics'::text) -> 'ephemeral_dob'::text) ->> 'dob_method'::text) = 'yes'::text) THEN ((t1.doc -> 'case_demographics'::text) ->> 'date_of_birth'::text)
            ELSE (((t1.doc -> 'case_demographics'::text) -> 'ephemeral_dob'::text) ->> 'dob_approx'::text)
        END)::date AS case_date_of_birth,
    t4.ag_label AS case_age_group,
    ((t1.doc -> 'case_location'::text) ->> 'case_county'::text) AS case_county,
    ((t1.doc -> 'case_location'::text) ->> 'case_subcounty'::text) AS case_sub_county,
    (((t2.doc -> 'fields'::text) -> 'co_final'::text) ->> 'cof_case_classification'::text) AS case_outcome,
    (((t2.doc -> 'fields'::text) -> 'co_final'::text) ->> 'cof_patient_status'::text) AS case_status,
    (((t2.doc -> 'fields'::text) -> 'co_final'::text) -> 'cof_date'::text) AS case_outcome_date,
    (((t1.doc -> 'meta'::text) ->> 'case_investigation_date'::text))::date AS case_investigation_date,
    ((((t2.doc -> 'geolocation_log'::text) -> 0) -> 'recording'::text) ->> 'latitude'::text) AS case_latitude,
    ((((t2.doc -> 'geolocation_log'::text) -> 0) -> 'recording'::text) ->> 'longitude'::text) AS case_longitude,
    t1.doc AS doc_case,
    t2.doc AS doc_case_outcome,
    t3.doc AS doc_case_clinical_information
   FROM ((((((couchdb t1
     LEFT JOIN couchdb t2 ON ((((t1.doc ->> '_id'::text) = ((((t2.doc -> 'fields'::text) -> 'inputs'::text) -> 'contact'::text) ->> '_id'::text)) AND ((t2.doc ->> 'form'::text) = 'case_outcome'::text))))
     LEFT JOIN couchdb t3 ON ((((t1.doc ->> '_id'::text) = ((((t3.doc -> 'fields'::text) -> 'inputs'::text) -> 'contact'::text) ->> '_id'::text)) AND ((t3.doc ->> 'form'::text) = 'case_clinical_information'::text))))
     LEFT JOIN dim_age_group t4 ON (((date_part('year'::text, age((((
        CASE
            WHEN ((((t1.doc -> 'case_demographics'::text) -> 'ephemeral_dob'::text) ->> 'dob_method'::text) = 'yes'::text) THEN ((t1.doc -> 'case_demographics'::text) -> 'date_of_birth'::text)
            ELSE (((t1.doc -> 'case_demographics'::text) -> 'ephemeral_dob'::text) -> 'dob_approx'::text)
        END)::character varying)::date)::timestamp with time zone)) >= (t4.ag_floor)::double precision) AND (date_part('year'::text, age((((
        CASE
            WHEN ((((t1.doc -> 'case_demographics'::text) -> 'ephemeral_dob'::text) ->> 'dob_method'::text) = 'yes'::text) THEN ((t1.doc -> 'case_demographics'::text) -> 'date_of_birth'::text)
            ELSE (((t1.doc -> 'case_demographics'::text) -> 'ephemeral_dob'::text) -> 'dob_approx'::text)
        END)::character varying)::date)::timestamp with time zone)) <= (t4.ag_ceiling)::double precision))))
     LEFT JOIN dim_syndromes t5 ON (((t5.syndrome_code)::text = ((((t1.doc -> 'cases_group'::text) -> 'outbreak_location'::text) -> 'outbreak'::text) ->> 'code'::text))))
     LEFT JOIN dim_occupation t6 ON (((t6.occupation_code)::text = ((t1.doc -> 'case_demographics_extended'::text) ->> 'case_occupation'::text))))
     LEFT JOIN dim_sex t7 ON (((t7.sex_code)::text = ((t1.doc -> 'case_demographics'::text) ->> 'case_sex'::text))))
  WHERE ((t1.doc ->> 'contact_type'::text) = 'case'::text);;
