-- Seed data into Research_Landing schema tables from S3 stage
COPY INTO Research_Landing.PATIENTS
FROM @research_s3_stage/patients.csv
FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' SKIP_HEADER=1);

COPY INTO Research_Landing.TRIALS
FROM @research_s3_stage/trials.csv
FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' SKIP_HEADER=1);

COPY INTO Research_Landing.PARTICIPATION
FROM @research_s3_stage/participation.csv
FILE_FORMAT = (TYPE = CSV FIELD_OPTIONALLY_ENCLOSED_BY='"' SKIP_HEADER=1);


