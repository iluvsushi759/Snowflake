/* 
re-creating the view every time:
    --You eliminate drift from manual edits
    --You ensure it matches the current table structure
    --You make it testable, version-controlled, and reproducible

This is especially critical in environments like Snowflake where:
    --Views can be edited ad hoc in the UI
    --Schema changes might silently break joins or filters
    --Teams might assume the view is “safe” just because it exists
*/


-- Create a view summarizing patient-trial relationships
CREATE OR REPLACE VIEW Research_Landing.PATIENT_TRIAL_SUMMARY AS
SELECT
    P.FIRST_NAME || ' ' || P.LAST_NAME AS FULL_NAME,
    P.GENDER,
    P.DOB,
    T.TRIAL_NAME,
    T.CONDITION,
    PT.STATUS,
    PT.CONSENT_DATE
FROM Research_Landing.PATIENTS P
JOIN Research_Landing.PARTICIPATION PT ON P.PATIENT_ID = PT.PATIENT_ID
JOIN Research_Landing.TRIALS T ON PT.TRIAL_ID = T.TRIAL_ID;
-- This view provides a consolidated look at patients and their trial participation
-- It can be used for reporting, analysis, and further transformations
-- Ensures consistency by being recreated from the latest table structures  