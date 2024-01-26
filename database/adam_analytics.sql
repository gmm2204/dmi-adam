DROP TABLE IF EXISTS "public"."dim_syndromes";
DROP TABLE IF EXISTS "public"."dim_sex";
DROP TABLE IF EXISTS "public"."dim_occupation";
DROP TABLE IF EXISTS "public"."dim_age_group";
DROP TABLE IF EXISTS "public"."dim_case_outcome";
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
CREATE TABLE "public"."dim_case_outcome" ( 
  "outcome_code" VARCHAR(250) NULL,
  "outcome_label" VARCHAR(250) NULL
);
ALTER TABLE "public"."dim_syndromes" DISABLE TRIGGER ALL;
ALTER TABLE "public"."dim_sex" DISABLE TRIGGER ALL;
ALTER TABLE "public"."dim_occupation" DISABLE TRIGGER ALL;
ALTER TABLE "public"."dim_age_group" DISABLE TRIGGER ALL;
ALTER TABLE "public"."dim_case_outcome" DISABLE TRIGGER ALL;
INSERT INTO "public"."dim_syndromes" ("syndrome_code", "syndrome_name") VALUES ('unknown', 'Unknown Disease / Syndrome');
INSERT INTO "public"."dim_syndromes" ("syndrome_code", "syndrome_name") VALUES ('covid19', 'COVID-19');
INSERT INTO "public"."dim_syndromes" ("syndrome_code", "syndrome_name") VALUES ('dysentery', 'Acute Diarrheal Syndrome (Diarrheal Diseases-Dysentery)');
INSERT INTO "public"."dim_syndromes" ("syndrome_code", "syndrome_name") VALUES ('cholera', 'Cholera');
INSERT INTO "public"."dim_syndromes" ("syndrome_code", "syndrome_name") VALUES ('sari_ili', 'SARI/ILI');
INSERT INTO "public"."dim_syndromes" ("syndrome_code", "syndrome_name") VALUES ('measles', 'Measles');
INSERT INTO "public"."dim_syndromes" ("syndrome_code", "syndrome_name") VALUES ('vhf', 'Viral Haemorrhagic Fever');
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
INSERT INTO "public"."dim_case_outcome" ("outcome_code", "outcome_label") VALUES ('confirmed', 'Confirmed');
INSERT INTO "public"."dim_case_outcome" ("outcome_code", "outcome_label") VALUES ('epi_linked', 'Epi Linked');
INSERT INTO "public"."dim_case_outcome" ("outcome_code", "outcome_label") VALUES ('negative', 'Negative');
INSERT INTO "public"."dim_case_outcome" ("outcome_code", "outcome_label") VALUES ('suspected', 'Suspected');
INSERT INTO "public"."dim_case_outcome" ("outcome_code", "outcome_label") VALUES ('probable', 'Probable');
INSERT INTO "public"."dim_case_outcome" ("outcome_code", "outcome_label") VALUES ('non_case', 'Non Case');
ALTER TABLE "public"."dim_syndromes" ENABLE TRIGGER ALL;
ALTER TABLE "public"."dim_sex" ENABLE TRIGGER ALL;
ALTER TABLE "public"."dim_occupation" ENABLE TRIGGER ALL;
ALTER TABLE "public"."dim_age_group" ENABLE TRIGGER ALL;
ALTER TABLE "public"."dim_case_outcome" ENABLE TRIGGER ALL;
