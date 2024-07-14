-- Step 1: Select distinct industries from funding_staging table
SELECT DISTINCT industry
FROM funding_staging;

-- Step 2: Create the industry_to_sector table
CREATE TABLE industry_to_sector(
    industries VARCHAR(255) PRIMARY KEY,
    sector VARCHAR(255)
);

-- Step 3: Insert distinct industries into the industry_to_sector table
INSERT INTO industry_to_sector (industries)
SELECT DISTINCT industry
FROM funding_staging;

-- Step 4: Display all rows from the industry_to_sector table
SELECT *
FROM industry_to_sector;

-- Step 5: Select industries related to 'Food and Beverages' (Sector 1)
SELECT *
FROM industry_to_sector
WHERE (industries LIKE '%food%' 
   OR industries LIKE '%qsr%' 
   OR industries LIKE '%restaurant%' 
   OR industries LIKE '%cafe%' 
   OR industries LIKE '%dairy%' 
   OR industries LIKE '%tea%'
   OR industries LIKE '%Brewery%' 
   OR industries LIKE '%Beverage%' 
   OR industries LIKE '%groc%')
   AND sector IS NULL;

-- Step 6: Categorize industries related to 'Food and Beverages' (Sector 1)
UPDATE industry_to_sector
SET sector = 'Food and Beverages'
WHERE (industries LIKE '%food%' 
   OR industries LIKE '%qsr%' 
   OR industries LIKE '%restaurant%' 
   OR industries LIKE '%cafe%' 
   OR industries LIKE '%dairy%' 
   OR industries LIKE '%tea%' 
   OR industries LIKE '%Brewery%' 
   OR industries LIKE '%Beverage%' 
   OR industries LIKE '%groc%')
   AND sector IS NULL;

-- Step 7: Select industries related to 'Agriculture' (Sector 2)
SELECT *
FROM industry_to_sector
WHERE industries LIKE '%agri%';

-- Step 8: Categorize industries related to 'Agriculture' (Sector 2)
UPDATE industry_to_sector
SET sector = 'Agriculture'
WHERE industries LIKE '%agri%' 
   AND sector IS NULL;

-- Step 9: Select industries related to 'Advertisement and Marketing' (Sector 3)
SELECT *
FROM industry_to_sector
WHERE industries LIKE '%adver%' 
   OR industries LIKE '%marketing%';

-- Step 10: Categorize industries related to 'Advertisement and Marketing' (Sector 3)
UPDATE industry_to_sector
SET sector = 'Advertisement and Marketing'
WHERE (industries LIKE '%adver%' 
   OR industries LIKE '%marketing%')
   AND sector IS NULL;

-- Step 11: Select industries related to 'Automotive' (Sector 4)
SELECT *
FROM industry_to_sector
WHERE (industries LIKE '%auto%' 
	OR industries LIKE '%car %'
	OR industries LIKE '%scooter%')
   AND sector IS NULL;

-- Step 12: Categorize industries related to 'Automotive' (Sector 4)
UPDATE industry_to_sector
SET sector = 'Automotive'
WHERE (industries LIKE '%auto%' 
	OR industries LIKE '%car %'
	OR industries LIKE '%scooter%')
   AND sector IS NULL;

-- Step 13: Select industries related to 'HealthCare' (Sector 5)
SELECT *
FROM industry_to_sector
WHERE (industries LIKE '%health%' 
   OR industries LIKE '%fit%'
   OR industries LIKE '%gym%' 
   OR industries LIKE '%medical%' 
   OR industries LIKE '%clinic%' 
   OR industries LIKE '%cancer%' 
   OR industries LIKE '%doctor%')
   AND sector IS NULL;

-- Step 14: Categorize industries related to 'Healthcare' (Sector 5)
UPDATE industry_to_sector
SET sector = 'Healthcare'
WHERE (industries LIKE '%health%' 
   OR industries LIKE '%pharmacy%' 
   OR industries LIKE '%fit%' 
   OR industries LIKE '%gym%' 
   OR industries LIKE '%medical%' 
   OR industries LIKE '%clinic%' 
   OR industries LIKE '%cancer%'  
   OR industries LIKE '%doctor%')
   AND sector IS NULL;

-- Step 15: Select industries related to 'Finance' (Sector 6)
SELECT *
FROM industry_to_sector
WHERE (industries LIKE '%fin%' 
   OR industries LIKE '%money%' 
   OR industries LIKE '%account%' 
   OR industries LIKE '%credit%' 
   OR industries LIKE '%bank%' 
   OR industries LIKE '%loan%' 
   OR industries LIKE '%wealth%' 
   OR industries LIKE '%payment%' 
   OR industries LIKE '%nbfc%' 
   OR industries LIKE '%investment%' 
   OR industries LIKE '%stock%' 
   OR industries LIKE '%insurance%')
   AND sector IS NULL;

-- Step 16: Categorize industries related to 'Finance' (Sector 6)
UPDATE industry_to_sector
SET sector = 'Finance'
WHERE (industries LIKE '%fin%' 
   OR industries LIKE '%money%' 
   OR industries LIKE '%account%' 
   OR industries LIKE '%credit%' 
   OR industries LIKE '%bank%' 
   OR industries LIKE '%loan%' 
   OR industries LIKE '%wealth%' 
   OR industries LIKE '%payment%' 
   OR industries LIKE '%nbfc%' 
   OR industries LIKE '%investment%' 
   OR industries LIKE '%stock%' 
   OR industries LIKE '%insurance%')
   AND sector IS NULL;

-- Step 17: Select industries related to 'Education' (Sector 7)
SELECT *
FROM industry_to_sector
WHERE (industries LIKE '%edu%' 
   OR industries LIKE '%learn%'  
   OR industries LIKE '%school%' 
   OR industries LIKE '%ed tech%' 
   OR industries LIKE '%edtech%' 
   OR industries LIKE '%e tech%' 
   OR industries LIKE '%coaching%' 
   OR industries LIKE '%test %' 
   OR industries LIKE '%exam%')
   AND sector IS NULL;

-- Step 18: Categorize industries related to 'Education' (Sector 7)
UPDATE industry_to_sector
SET sector = 'Education'
WHERE (industries LIKE '%edu%' 
   OR industries LIKE '%learn%'  
   OR industries LIKE '%school%' 
   OR industries LIKE '%ed tech%' 
   OR industries LIKE '%edtech%' 
   OR industries LIKE '%e tech%' 
   OR industries LIKE '%coaching%' 
   OR industries LIKE '%test %' 
   OR industries LIKE '%exam%')
   AND sector IS NULL;

-- Step 19: Select industries related to 'Hotel' (Sector 8)
SELECT *
FROM industry_to_sector
WHERE (industries LIKE '%hotel%' 
   OR industries LIKE '%hospitality%'
   OR industries LIKE '%travel%')
   AND sector IS NULL;

-- Step 20: Categorize industries related to 'Hospitality' (Sector 8)
UPDATE industry_to_sector
SET sector = 'Hospitality'
WHERE (industries LIKE '%hotel%' 
   OR industries LIKE '%hospitality%'
   OR industries LIKE '%travel%')
   AND sector IS NULL;

-- Step 21: Select industries related to 'E-Commerce' (Sector 9)
SELECT *
FROM industry_to_sector
WHERE (industries LIKE '%ecomm%' 
   OR industries LIKE '%e-comm%' 
   OR industries LIKE '%e comm%'
   OR industries LIKE '%order%' 
   OR industries LIKE '%market%' 
   OR industries LIKE '%store%' 
   OR industries LIKE '%delivery%'
   OR industries LIKE '%e tail%'
   OR industries LIKE '%etail%'
   OR industries LIKE '%merchandize%')
   AND sector IS NULL;

-- Step 22: Categorize industries related to 'E-Commerce' (Sector 9)
UPDATE industry_to_sector
SET sector = 'E-Commerce'
WHERE (industries LIKE '%ecomm%' 
   OR industries LIKE '%e-comm%' 
   OR industries LIKE '%order%' 
   OR industries LIKE '%market%' 
   OR industries LIKE '%merchandize%' 
   OR industries LIKE '%e commerce%' 
   OR industries LIKE '%delivery%' 
   OR industries LIKE '%e tail%'
   OR industries LIKE '%etail%'
   OR industries LIKE '%store%')
   AND sector IS NULL;

-- Step 23: Select industries related to 'Gaming' (Sector 10)
SELECT *
FROM industry_to_sector
WHERE industries LIKE '%gam%' 
   AND sector IS NULL;

-- Step 24: Categorize industries related to 'Online Gaming' (Sector 10)
UPDATE industry_to_sector
SET sector = 'Online Gaming'
WHERE industries LIKE '%gam%' 
   AND sector IS NULL;

-- Step 25: Select industries related to 'Transportation and Logistics' (Sector 11)
SELECT *
FROM industry_to_sector
WHERE (industries LIKE '%cab%' 
   OR industries LIKE '%transport%' 
   OR industries LIKE '%logistic%' 
   OR industries LIKE '%bus %' 
   OR industries LIKE '%freight%' 
   OR industries LIKE '%pool%' 
   OR industries LIKE '%taxi%' 
   OR industries LIKE '%ride%' 
   OR industries LIKE '%bike%')
   AND sector IS NULL;

-- Step 26: Categorize industries related to 'Transportation and Logistics' (Sector 11)
UPDATE industry_to_sector
SET sector = 'Transportation and Logistics'
WHERE (industries LIKE '%cab%' 
   OR industries LIKE '%transport%' 
   OR industries LIKE '%logistic%' 
   OR industries LIKE '%bus %' 
   OR industries LIKE '%freight%' 
   OR industries LIKE '%pool%' 
   OR industries LIKE '%taxi%' 
   OR industries LIKE '%ride%' 
   OR industries LIKE '%bike%')
   AND sector IS NULL;

-- Step 27: Select industries related to 'Fashion' (Sector 12)
SELECT *
FROM industry_to_sector
WHERE (industries LIKE '%cloth%' 
   OR industries LIKE '%fashion%' 
   OR industries LIKE '%apparel%')
   AND sector IS NULL;

-- Step 28: Categorize industries related to 'Fashion' (Sector 12)
UPDATE industry_to_sector
SET sector = 'Fashion'
WHERE (industries LIKE '%cloth%' 
   OR industries LIKE '%fashion%' 
   OR industries LIKE '%apparel%')
   AND sector IS NULL;

-- Step 29: Select industries related to 'Real Estate' (Sector 13)
SELECT *
FROM industry_to_sector
WHERE (industries LIKE '%estate%' 
   OR industries LIKE '%property%' 
   OR industries LIKE '%flat%' 
   OR industries LIKE '%real estate%' 
   OR industries LIKE '%housing%')
   AND sector IS NULL;

-- Step 30: Categorize industries related to 'Real Estate' (Sector 13)
UPDATE industry_to_sector
SET sector = 'Real Estate'
WHERE (industries LIKE '%estate%' 
   OR industries LIKE '%property%' 
   OR industries LIKE '%flat%' 
   OR industries LIKE '%real estate%' 
   OR industries LIKE '%housing%')
   AND sector IS NULL;

-- Step 31: Select and Update Industries Related to Technology (Sector 14)
SELECT *
FROM industry_to_sector
WHERE (industries LIKE '%tech%' 
   OR industries LIKE '%platform%' 
   OR industries LIKE '%intelligence%' 
   OR industries LIKE '%consulting%' 
   OR industries LIKE '%software%' 
   OR industries = 'it' 
   OR industries LIKE '%mobile%'
   OR industries LIKE '%app%'
   OR industries LIKE '%saas%'
   OR industries LIKE '%web%'
   OR industries LIKE '%online%'
   OR industries LIKE '%virtual%'
   OR industries LIKE '%social%'
   OR industries LIKE '%data%')
   AND sector IS NULL;

UPDATE industry_to_sector
SET sector = 'Technology'
WHERE (industries LIKE '%tech%' 
   OR industries LIKE '%platform%' 
   OR industries LIKE '%intelligence%' 
   OR industries LIKE '%consulting%' 
   OR industries LIKE '%software%' 
   OR industries = 'it' 
   OR industries LIKE '%mobile%'
   OR industries LIKE '%app%'
   OR industries LIKE '%saas%'
   OR industries LIKE '%web%'
   OR industries LIKE '%online%'
   OR industries LIKE '%virtual%'
   OR industries LIKE '%social%'
   OR industries LIKE '%data%')
   AND sector IS NULL;

-- Step 32: Select and Update Industries Related to Sustainability (Sector 15)
SELECT *
FROM industry_to_sector
WHERE (industries LIKE '%waste%' 
   OR industries LIKE '%power%'
   OR industries LIKE '%recycl%'
   OR industries LIKE '%water%'
   OR industries LIKE '%energy%')
   AND sector IS NULL;

UPDATE industry_to_sector
SET sector = 'Sustainability'
WHERE (industries LIKE '%waste%' 
   OR industries LIKE '%power%'
   OR industries LIKE '%recycl%'
   OR industries LIKE '%water%'
   OR industries LIKE '%energy%')
   AND sector IS NULL;

-- Step 33: Select and Update Industries Related to Services (Sector 16)
SELECT *
FROM industry_to_sector
WHERE (industries LIKE '%service%' 
   OR industries LIKE '%svcs%' 
   OR industries LIKE '%demand%')
   AND sector IS NULL;

UPDATE industry_to_sector
SET sector = 'Services'
WHERE (industries LIKE '%service%' 
   OR industries LIKE '%svcs%' 
   OR industries LIKE '%demand%')
   AND sector IS NULL;

-- Step 34: Handle Null or 'nan' Industries in Funding Staging
SELECT *
FROM funding_staging
WHERE industry = 'nan' OR industry IS NULL;

UPDATE funding_staging
SET industry = 'Other'
WHERE industry = 'nan' OR industry IS NULL;

UPDATE industry_to_sector
SET industries = 'Other'
WHERE industries = 'nan' OR industries IS NULL;

-- Step 35: Final Cleanup for Industry Sectors
SELECT *
FROM industry_to_sector
WHERE sector IS NULL;

UPDATE industry_to_sector
SET sector = 'Other'
WHERE sector IS NULL;

-- Step 36: Review Distinct Sectors
SELECT DISTINCT sector
FROM industry_to_sector;

-- Step 37: Add Sector Column to Funding Staging
ALTER TABLE funding_staging
ADD COLUMN sector VARCHAR(255);

-- Step 38: Update Funding Staging with Industry Sectors
UPDATE funding_staging
SET sector = (SELECT sector FROM industry_to_sector WHERE industry_to_sector.industries = funding_staging.industry)
WHERE EXISTS (SELECT 1 FROM industry_to_sector WHERE industry_to_sector.industries = funding_staging.industry);



select distinct industry, sector
from funding_staging
order by sector;
