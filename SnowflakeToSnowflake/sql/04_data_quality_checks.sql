-- ✅ Row counts
SELECT 'PATIENTS' AS table_name, COUNT(*) AS row_count FROM Research_Landing.PATIENTS;
SELECT 'TRIALS' AS table_name, COUNT(*) AS row_count FROM Research_Landing.TRIALS;
SELECT 'PARTICIPATION' AS table_name, COUNT(*) AS row_count FROM Research_Landing.PARTICIPATION;

-- ✅ Referential integrity: PARTICIPATION → PATIENTS
SELECT COUNT(*) AS invalid_patient_refs
FROM Research_Landing.PARTICIPATION PT
LEFT JOIN Research_Landing.PATIENTS P ON PT.PATIENT_ID = P.PATIENT_ID
WHERE P.PATIENT_ID IS NULL;

-- ✅ Referential integrity: PARTICIPATION → TRIALS
SELECT COUNT(*) AS invalid_trial_refs
FROM Research_Landing.PARTICIPATION PT
LEFT JOIN Research_Landing.TRIALS T ON PT.TRIAL_ID = T.TRIAL_ID
WHERE T.TRIAL_ID IS NULL;

-- ✅ Null checks in critical fields
SELECT COUNT(*) AS null_patient_names
FROM Research_Landing.PATIENTS
WHERE FIRST_NAME IS NULL OR LAST_NAME IS NULL;

SELECT COUNT(*) AS null_trial_names
FROM Research_Landing.TRIALS
WHERE TRIAL_NAME IS NULL;

SELECT COUNT(*) AS null_participation_status
FROM Research_Landing.PARTICIPATION
WHERE STATUS IS NULL;

-- ✅ Optional: Consent date after DOB
SELECT COUNT(*) AS invalid_consent_dates
FROM Research_Landing.PARTICIPATION PT
JOIN Research_Landing.PATIENTS P ON PT.PATIENT_ID = P.PATIENT_ID
WHERE PT.CONSENT_DATE < P.DOB;
