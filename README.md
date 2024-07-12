# Analysis on Funding of Indian Startups

This project focuses on cleaning and standardizing a dataset related to startup funding, as well as categorizing various industries into standardized sectors. The primary goals are to ensure data integrity by removing duplicates, handling null values, and enhancing dataset usability through industry classification.

## Table of Contents
- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Steps Involved](#steps-involved)
  - [Cleaning and Standardizing the Dataset](#cleaning-and-standardizing-the-dataset)
    - [Removing Duplicates](#removing-duplicates)
    - [Standardizing Data](#standardizing-data)
    - [Handling Null or Blank Values](#handling-null-or-blank-values)
    - [Cleaning Up Specific Columns](#cleaning-up-specific-columns)
    - [Special Handling of Amount_USD Column](#special-handling-of-amount_usd-column)
  - [Industry Sector Classification](#industry-sector-classification)
    - [Industry Classification](#industry-classification)
    - [Handling Null or 'nan' Industries](#handling-null-or-nan-industries)
    - [Final Cleanup and Sector Assignment](#final-cleanup-and-sector-assignment)
- [Running the SQL Scripts](#running-the-sql-scripts)
- [Notes](#notes)
- [Contributing](#contributing)
- [License](#license)

## Introduction
This repository contains SQL scripts for cleaning a startup funding dataset and classifying industries into standardized sectors. The scripts include steps to remove duplicate records, standardize column names and values, handle null or blank entries, and ensure accurate categorization of industries.

## Prerequisites
- MySQL or any other compatible SQL database.
- Basic understanding of SQL.

## Steps Involved

### Cleaning and Standardizing the Dataset

#### Removing Duplicates
- **Create a Staging Table**: A staging table identical to the original dataset was created to work on the data without affecting the original.
- **Insert Data into Staging Table**: Data from the original table was copied to the staging table.
- **Identify and Remove Duplicates**: Duplicate records were identified using a Common Table Expression (CTE) with the `ROW_NUMBER` function and then removed.

#### Standardizing Data
- **Rename Columns**: Columns were renamed for consistency and to follow naming conventions.
- **Trim Whitespace**: Leading and trailing whitespace in text fields were removed to standardize the data.
- **Standardize Specific Values**: Common values were standardized (e.g., different spellings of startup names and city names).

#### Handling Null or Blank Values
- **Identify Null or Blank Values**: Queries were run to find records with null or blank values.
- **Update Null or Blank Values**: These values were updated to more meaningful default values or inferred from other related records where possible.

#### Cleaning Up Specific Columns
- **Industry Column**: Missing values were updated by inferring from other records with the same startup name.
- **SubVertical Column**: Similar cleaning steps were applied to the SubVertical column.
- **City Column**: Standardized city names and corrected common misspellings.
- **Investors Column**: Removed unnecessary characters and standardized entries.

#### Special Handling of Amount_USD Column
- **Reduce Values Temporarily**: Values in the Amount_USD column were divided by 1000 to make them manageable.
- **Alter Column Type**: The column type was then modified to FLOAT.
- **Restore Original Values**: After changing the column type, the values were multiplied back by 1000 to restore their original scale.

### Industry Sector Classification

#### Industry Classification
- A series of queries were executed to categorize industries based on keywords related to sectors such as Food and Beverages, Agriculture, Automotive, Healthcare, Finance, Education, Hospitality, E-Commerce, Gaming, Transportation and Logistics, Fashion, Real Estate, Technology, Sustainability, and Services. Each industry was assigned a sector using SQL `UPDATE` statements based on specific conditions.

#### Handling Null or 'nan' Industries
- Queries were run to identify and update any industries marked as 'nan' or null to a more meaningful category ('Other').

#### Final Cleanup and Sector Assignment
- Final cleanup steps included assigning 'Other' to any remaining null sectors, reviewing distinct sectors, and updating the original funding dataset with the newly classified sectors.
