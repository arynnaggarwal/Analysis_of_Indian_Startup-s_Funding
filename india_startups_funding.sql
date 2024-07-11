-- Step 1: Remove Duplicates


select * from startup_funding;

-- Create a staging table with the same structure as the original startup_funding table
create table funding_staging like startup_funding;

-- Display the structure of the newly created staging table
select * from funding_staging;

-- Insert all records from the original table into the staging table
insert funding_staging select * from startup_funding;

-- Check for duplicates by using a CTE (Common Table Expression) and row_number() function
with cte as (
    select *, 
           row_number() over (partition by `Date dd/mm/yyyy`, `Startup Name`, `Industry Vertical`, SubVertical, `City  Location`,
                               `Investors Name`, `InvestmentnType`, `Amount in USD`, Remarks) as row_num
    from funding_staging
)
select *
from cte
where row_num > 1;
-- There are no duplicates in this data



-- Step 2: Standardize the Data



-- Display the current data to review before making changes
select * from funding_staging;

-- Rename columns to standardize the table structure
alter table funding_staging
rename column `ï»¿Sr No` to `S_No`,
rename column `Date dd/mm/yyyy` to `Date`,
rename column `Startup Name` to Startup_Name,
rename column `Industry Vertical` to Industry,
rename column `City  Location` to City,
rename column `Amount in USD` to Amount_USD,
rename column `Investors Name` to Investors,
rename column `InvestmentnType` to InvestmentType;

-- Display the data after renaming columns
select * from funding_staging;

-- Trim leading and trailing spaces from the Startup_Name column
update funding_staging
set Startup_Name = trim(Startup_Name);

-- Check for specific startup names that need standardization
select *
from funding_staging
where Startup_Name = 'nan';

select *
from funding_staging
where Startup_Name like '%byju%';

-- Clean up specific startup names and standardize them
update funding_staging
set Startup_Name = 'BYJUs'
where Startup_Name like '%byju%';

select distinct Startup_Name
from funding_staging
order by Startup_Name;

-- Check for specific patterns in startup names and clean them up
select *
from funding_staging
where Startup_Name like 'crown%';

update funding_staging
set startup_name = 'CrownIt'
where Startup_Name like 'crown%';

-- Remove spaces and unwanted characters from startup names
update funding_staging
set startup_name = replace(startup_name, ' ', '');

select *
from funding_staging
where Startup_Name like '%\\\\%';                                         -- \\

update funding_staging
set startup_name = replace(startup_name, '\\\\xc2\\\\xa0', ''),           -- \\xc2\\xa0
    startup_name = replace(startup_name, '\\\\xe2\\\\x80\\\\x99', ''),    -- \\xe2\\x80\\x99
    startup_name = replace(startup_name, '\\\xe2\\\x80\\\x99', ''),       -- \xe2\x80\x99
    startup_name = replace(startup_name, '\\\\n', '');					  -- \\

-- Remove unwanted suffixes from startup names
select *
from funding_staging
where Startup_Name like '%.com' or Startup_Name like 'https:%' or Startup_Name like '%.co' or Startup_Name like '%.in';

UPDATE funding_staging
SET startup_name = REPLACE(startup_name, '.com', '')
WHERE startup_name LIKE '%.com';

UPDATE funding_staging
SET startup_name = REPLACE(startup_name, '.co', '')
WHERE startup_name LIKE '%.co';

UPDATE funding_staging
SET startup_name = REPLACE(startup_name, '.in', '')
WHERE startup_name LIKE '%.in';

UPDATE funding_staging
SET startup_name = 'wealthbucket'
WHERE startup_name = 'https://www.wealthbucket.in/';

-- Standardize industry names by removing unwanted characters
select distinct industry
from funding_staging
order by industry desc;

update funding_staging
set industry = replace(industry, '\\\\xc2\\\\xa0', ''),
    industry = replace(industry, '\\\\xc3\\\\xa9\\\\xe2\\\\x80\\\\x99', ''),
    industry = replace(industry, '\\\\xe2\\\\x80\\\\x93', '');

-- Handle null or invalid values in the Industry column by using data from other rows


-- Select records where the industry is 'nan' to identify missing values
select *
from funding_staging
where industry = 'nan';


-- Create a Common Table Expression (CTE) to assign row numbers to each record within each startup group
-- This helps in identifying duplicate entries and assists in updating missing values
with cte as (
    select *, 
           row_number() over (partition by `Startup_Name` order by `Startup_Name`) as row_num
    from funding_staging
)
-- Select all records from the CTE, ordered by startup name, to review data and row numbers
select *
from cte
order by startup_name;


-- Perform a self-join on the staging table to find records where the industry is 'nan'
-- Match these records with non-null industry values from other rows with the same startup name
SELECT t1.startup_name, t1.industry, t2.industry
FROM funding_staging t1
JOIN funding_staging t2 ON t1.startup_name = t2.startup_name
WHERE t1.industry = 'nan' AND (t2.industry IS NOT NULL AND t2.industry <> 'nan');


-- Update the industry values in the staging table where the industry is 'nan'
-- Set these to the corresponding non-null industry values from matching startup names
Update funding_staging t1
JOIN funding_staging t2 ON t1.startup_name = t2.startup_name
SET t1.industry = t2.industry
WHERE t1.industry = 'nan' AND (t2.industry IS NOT NULL AND t2.industry <> 'nan');


-- Create another CTE to assign row numbers again after the update
-- This helps in identifying and reviewing records with industry still 'nan' after the update
with cte as (
    select *, 
           row_number() over (partition by `Startup_Name` order by `Startup_Name`) as row_num
    from funding_staging
)
-- Select records from the CTE where there are duplicate rows (row_num > 1) and industry is still 'nan'
-- Order by startup name to facilitate review and further updates if needed
select *
from cte
where row_num > 1 and industry = 'nan'
order by startup_name;


-- Standardize subvertical names by removing unwanted characters
select distinct SubVertical
from funding_staging
order by 1;

with cte as (
    select *, row_number() over (partition by `Startup_Name`) as row_num
    from funding_staging
)
select *
from cte
order by startup_name;

SELECT t1.startup_name, t1.SubVertical, t2.SubVertical
FROM funding_staging t1
JOIN funding_staging t2 ON t1.startup_name = t2.startup_name
WHERE t1.SubVertical = 'nan' AND (t2.SubVertical IS NOT NULL AND t2.SubVertical <> 'nan');

Update funding_staging t1
JOIN funding_staging t2 ON t1.startup_name = t2.startup_name
SET t1.SubVertical = t2.SubVertical
WHERE t1.SubVertical = 'nan' AND (t2.SubVertical IS NOT NULL AND t2.SubVertical <> 'nan');

-- Remove unwanted characters from subvertical names
select distinct SubVertical
from funding_staging
where SubVertical like '%\\\\%';

update funding_staging
set SubVertical = replace(SubVertical, '\\\\xc2\\\\xa0', ''),                   -- \\xc2\\xa0
    SubVertical = replace(SubVertical, '\\\\n', ''),							-- \\
    SubVertical = replace(SubVertical, '\\\\xce\\\\x80\\\\x99', ''),			-- \\xce\\x80\\x99
    SubVertical = replace(SubVertical, '\\\\xe2\\\\x80\\\\x99', ''),			-- \\xe2\\x80\\99
    SubVertical = replace(SubVertical, '\\\\xc3\\\\xa9', ''),					-- \\xc3\\xa9
    SubVertical = replace(SubVertical,'\\\xe2\\\x80\\\x99',''),					-- \xe2\x80\x99
    SubVertical = replace(SubVertical, '\\\\', '');								-- \\

select distinct SubVertical
from funding_staging;

with cte as (
    select *, row_number() over (partition by `Startup_Name`) as row_num
    from funding_staging
)
select *
from cte
-- where row_num>1 and SubVertical = 'nan'
order by startup_name;

SELECT t1.startup_name, t1.SubVertical, t2.SubVertical
FROM funding_staging t1
JOIN funding_staging t2 ON t1.startup_name = t2.startup_name
WHERE t1.SubVertical = 'nan' AND (t2.SubVertical IS NOT NULL AND t2.SubVertical <> 'nan');

Update funding_staging t1
JOIN funding_staging t2 ON t1.startup_name = t2.startup_name
SET t1.SubVertical = t2.SubVertical
WHERE t1.SubVertical = 'nan' AND (t2.SubVertical IS NOT NULL AND t2.SubVertical <> 'nan');


-- Standardize city names by removing unwanted characters and correcting common misspellings
select distinct city
from funding_staging
order by city;

with cte as (
    select *, row_number() over (partition by `Startup_Name`) as row_num
    from funding_staging
)
select *
from cte
where row_num > 2 and city = 'nan'
order by startup_name;

SELECT t1.startup_name, t1.city, t2.city
FROM funding_staging t1
JOIN funding_staging t2 ON t1.startup_name = t2.startup_name
WHERE t1.city = 'nan' AND (t2.city IS NOT NULL AND t2.city <> 'nan');

Update funding_staging t1
JOIN funding_staging t2 ON t1.startup_name = t2.startup_name
SET t1.city = t2.city
WHERE t1.city = 'nan' AND (t2.city IS NOT NULL AND t2.city <> 'nan');

update funding_staging
set city = replace(city, '\\\\xc2\\\\xa0', '');						-- \\xc2\\xa0

select distinct city
from funding_staging
where city like 'Ah%dabad';

update funding_staging
set city = 'Ahemdabad'
where city like 'Ah%dabad';

update funding_staging
set city = replace(city, 'Bengaluru', 'Bangalore'),
    city = replace(city, 'US', 'USA'),
    city = replace(city, 'USAA', 'USA'),
    city = replace(city, 'Gurgaon', 'Gurugram'),
    city = replace(city, 'New Delhi', 'Delhi'),
    city = replace(city, 'Bhubneswar', 'Bhubaneswar');



-- Clean up and standardize the Investors column
select distinct investors
from funding_staging
order by investors;

update funding_staging
set investors = replace(investors, '\\\\xc2\\\\xa0', '');						-- \\xc2\\xa0

select distinct investors
from funding_staging
where investors like '%,';

update funding_staging
set investors = replace(investors, ',', '')
where investors like '%,';

select distinct investors
from funding_staging;

-- Clean up and standardize the Remarks column
select distinct remarks
from funding_staging
order by remarks;

select *
from funding_staging
where remarks = 'nan' or remarks = 'n/a' or remarks = 'no confirmation' or remarks = 'more details';

update funding_staging
set remarks = ''
where remarks = 'nan' or remarks = 'n/a' or remarks = 'no confirmation' or remarks = 'more details';

select distinct remarks
from funding_staging
where remarks like '%\\\\%';

update funding_staging
set remarks = replace(remarks, '\\\\xc2\\\\xa0', '');					-- \\xc2\\xa0



-- Update InvestmentType based on Remarks column if not empty
select distinct InvestmentType
from funding_staging
order by InvestmentType;

select distinct InvestmentType, remarks
from funding_staging;

UPDATE funding_staging
SET InvestmentType = CASE WHEN remarks <> '' THEN remarks ELSE InvestmentType END;

-- Standardize values in the InvestmentType column
update funding_staging
set InvestmentType = 'Debt'
where InvestmentType like '%Debt%';

update funding_staging
set InvestmentType = 'Seed Funding'
where InvestmentType like '%Seed%' or InvestmentType like '%Angel%';

update funding_staging
set InvestmentType = 'Venture'
where InvestmentType like '%Venture%';

update funding_staging
set InvestmentType = 'Equity'
where InvestmentType like '%Equity%';

update funding_staging
set InvestmentType = 'Pre Series A'
where InvestmentType = 'Pre-series A';

update funding_staging
set InvestmentType = replace(InvestmentType, 'Series-A', 'Series A');

-- Standardize and clean up the Amount_USD column
select distinct Amount_USD
from funding_staging
order by Amount_USD;

update funding_staging
set Amount_USD = replace(Amount_USD, '\\\\xc2\\\\xa0', '');				-- \\xc2\\xa0

select *
from funding_staging
where Amount_USD = 'N/A' or Amount_USD = 'nan' or Amount_USD = 'Private Equity' or 
	Amount_USD = 'undisclosed' or Amount_USD = 'unknown';

update funding_staging
set Amount_USD = ''
where Amount_USD = 'N/A' or Amount_USD = 'nan' or Amount_USD = 'Private Equity' or 
	Amount_USD = 'undisclosed' or Amount_USD = 'unknown';

select *
from funding_staging
where Amount_USD = '';

UPDATE funding_staging
SET amount_usd = 0
WHERE amount_usd = '';

select distinct Amount_USD
from funding_staging;

select *
from funding_staging
where Amount_USD like '%,';

update funding_staging
set Amount_USD = replace(Amount_USD, ',', '');

select distinct Amount_USD
from funding_staging;



-- Convert Amount_USD to float and scale values correctly


-- Step a: Reduce the values in Amount_USD by dividing by 1000
-- This is necessary because the current values are too large to directly alter the column type
update funding_staging
set Amount_USD = Amount_USD / 1000;

-- Step b: Alter the column type of Amount_USD to float
-- This change was previously not possible due to the large values in the column
ALTER TABLE funding_staging
MODIFY COLUMN Amount_USD float;

-- Step c: Select distinct values from Amount_USD to ensure the values are correctly adjusted
select distinct Amount_USD
from funding_staging;


-- Step d: Restore the original scale of Amount_USD by multiplying by 1000
-- This reverts the values to their original scale after the type change
update funding_staging
set Amount_USD = Amount_USD * 1000;



select *
from funding_staging
where amount_usd = 0;

-- Remove records with zero Amount_USD as they are useless
delete
from funding_staging
where amount_usd = 0;


-- Step 4: Drop unnecessary columns from the staging table beacuse important remarks are already used
alter table funding_staging
drop column S_No, 
drop column remarks;


-- Final cleaned and standardized table
select *
from funding_staging;
