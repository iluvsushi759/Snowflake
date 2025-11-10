# Snowflake
this repo is for a quick demo of how to perform CI/CD.  There are 4 .SQL scripts located at:  

SnowflakeToSnowflake/SQL/01_create_tables.sql  
SnowflakeToSnowflake/SQL/02_seed_data.sql  
SnowflakeToSnowflake/SQL/03_transform.sql  
SnowflakeToSnowflake/SQL/04_data_quality_checks.sql  

**Activation**  
YML script is placed in the .github/workflow directory.  This is where we will control our workflow
.sql  


**Linting Option**  
I'm using SQLFluff and unfortunately, it's VERY strict, so I created this config file to make exceptions.

**Script Sequence**  

**1️⃣	01_create_tables.sql** -- Creates the core database tables in Snowflake, defining schema structures, data  types, and constraints. This establishes the foundational data model for all subsequent operations.

**2️⃣	02_seed_data.sql** -- Loads initial datasets into the newly created tables using Snowflake’s Storage Integration. This step copies raw data files from cloud storage (e.g., AWS S3) into Snowflake tables.

**3️⃣	03_transform.sql** -- Performs transformations and joins across the seeded tables. Typically this creates views or derived tables that represent curated, business-ready datasets.

**4️⃣	04_data_quality_checks.sql** -- Runs basic data validation checks (such as row counts, null checks, and data type verification) to confirm that the data was successfully loaded and transformed.

**Application**
Once an object or code is updated or deleted, the continuous integration will perform it's checks and linting then your deployment will begin.  If all passes, go through your PULL request to merge with your master/prod branch.  And schedule your change control.

I chose to rather not have my CI as part of the test and CD as the prod but seperate it as CI/CD for dev branch and then another CI/CD for prod/main branch.

**Why This Approach**

This modular, step-by-step pipeline offers several benefits:  

* Clear Separation of Concerns: Each script has a single purpose—creation, loading, transformation, or validation—making debugging and maintenance easier.  

* Reproducible CI/CD: The workflow can be re-run from scratch at any time with consistent results.  

* Scalable Design: As new tables or transformations are added, new scripts can be appended without impacting existing steps.  

* Transparency and Auditability: Each stage is visible in GitHub and traceable in CI/CD logs, ensuring full visibility into what’s deployed and why.  

* Data Quality Assurance: The final validation step ensures that downstream consumers only interact with verified data.  

**Aplication**  

This demo can be also used in other applications such as:  
* inserting or changing code in your terminal and pushing this to have immediate testing  
* ROLLBACK option - if we make a change we can easily re-apply our former state.  As long as the older commit that is pointing to still has it's files within S3 and hasn't changed, we can perform this.  This is a code change tracker where we can revert structure and possibly data.

