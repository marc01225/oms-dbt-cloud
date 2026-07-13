CREATE OR REPLACE STAGE SLEEKMART_OMS.L1_LANDING.data_lake
    URL = 's3://oms-data-jb/'
    CREDENTIALS = (
        AWS_KEY_ID = '675079659332'
        AWS_SECRET_KEY = 'SarahJK2025!'
    );