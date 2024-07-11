# Analysis on Funding of India Startups

This project focuses on cleaning and standardizing a dataset related to startup funding. The primary goal is to ensure data integrity by removing duplicates, handling null values, and standardizing various columns to make the dataset more usable for analysis.

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Steps Involved](#steps-involved)
  - [Removing Duplicates](#removing-duplicates)
  - [Standardizing Data](#standardizing-data)
  - [Handling Null or Blank Values](#handling-null-or-blank-values)
  - [Cleaning Up Specific Columns](#cleaning-up-specific-columns)
- [Special Handling of Amount_USD Column](#special-handling-of-amount_usd-column)
- [Running the SQL Script](#running-the-sql-script)
- [Notes](#notes)
- [Contributing](#contributing)
- [License](#license)

## Introduction

This repository contains the SQL script for cleaning a startup funding dataset. The script includes steps to remove duplicate records, standardize column names and values, handle null or blank entries, and clean up specific columns to ensure consistency.

## Prerequisites

- MySQL or any other compatible SQL database.
- Basic understanding of SQL.

## Steps Involved

### Removing Duplicates

1. **Create a Staging Table**: A staging table identical to the original dataset was created to work on the data without affecting the original.
2. **Insert Data into Staging Table**: Data from the original table was copied to the staging table.
3. **Identify and Remove Duplicates**: Duplicate records were identified using a Common Table Expression (CTE) with the `ROW_NUMBER` function and then removed.

### Standardizing Data

1. **Rename Columns**: Columns were renamed for consistency and to follow naming conventions.
2. **Trim Whitespace**: Leading and trailing whitespace in text fields were removed to standardize the data.
3. **Standardize Specific Values**: Common values were standardized (e.g., different spellings of startup names and city names).

### Handling Null or Blank Values

1. **Identify Null or Blank Values**: Queries were run to find records with null or blank values.
2. **Update Null or Blank Values**: These values were updated to more meaningful default values or inferred from other related records where possible.

### Cleaning Up Specific Columns

1. **Industry Column**: Missing values were updated by inferring from other records with the same startup name.
2. **SubVertical Column**: Similar cleaning steps were applied to the SubVertical column.
3. **City Column**: Standardized city names and corrected common misspellings.
4. **Investors Column**: Removed unnecessary characters and standardized entries.

## Special Handling of Amount_USD Column

Due to the large values in the `Amount_USD` column, a special approach was needed:

1. **Reduce Values Temporarily**: Values in the `Amount_USD` column were divided by 1000 to make them manageable.
2. **Alter Column Type**: The column type was then modified to `FLOAT`.
3. **Restore Original Values**: After changing the column type, the values were multiplied back by 1000 to restore their original scale.
