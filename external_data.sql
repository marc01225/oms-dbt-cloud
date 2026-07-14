
    -- Step 1: Create storage integration (ACCOUNTADMIN required)
CREATE OR REPLACE STORAGE INTEGRATION s3_oms_integration
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = 'S3'
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::675079659332:role/External_s3_role'
  ENABLED = TRUE
  STORAGE_ALLOWED_LOCATIONS = ('s3://oms-datalake-jb/');

-- Step 2: Get Snowflake's IAM user ARN and external ID to configure trust policy
DESC INTEGRATION s3_oms_integration;

-- Step 3: Create stage using the integration (no credentials needed)
CREATE OR REPLACE STAGE SLEEKMART_OMS.L1_LANDING.PRODUCT_CATALOG_EXT
  URL = 's3://oms-datalake-jb/'
  STORAGE_INTEGRATION = s3_oms_integration;
  
LIST @SLEEKMART_OMS.L1_LANDING.PRODUCT_CATALOG_EXT;
