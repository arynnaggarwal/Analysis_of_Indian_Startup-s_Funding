# Analysis and Visualization of Indian Startup's Funding

## Power BI Report
Explore the live Power BI dashboard for an interactive experience: [View Project on Power BI](https://app.powerbi.com/links/xrQn67kDzK?ctid=4491fde7-7cec-49af-b870-98ef09899d11&pbi_source=linkShare)

## Overview
This project focuses on two main components: cleaning and standardizing a dataset related to startup funding, and analyzing the funding landscape of Indian startups using Power BI. The primary goals are to ensure data integrity and provide insights into trends and patterns in the startup ecosystem.

## Table of Contents
- [Introduction](#introduction)
- [Data Cleaning and Standardization](#data-cleaning-and-standardization)
  - [Removing Duplicates](#removing-duplicates)
  - [Standardizing Data](#standardizing-data)
  - [Handling Null or Blank Values](#handling-null-or-blank-values)
  - [Cleaning Up Specific Columns](#cleaning-up-specific-columns)
  - [Special Handling of Amount_USD Column](#special-handling-of-amount_usd-column)
  - [Industry Sector Classification](#industry-sector-classification)
- [Funding Analysis and Visualization](#funding-analysis-and-visualization)
  - [Power BI Visualizations](#power-bi-visualizations)
  - [Insights](#insights)

## Introduction
This repository contains SQL scripts for cleaning a startup funding dataset and Power BI files for analyzing and visualizing the funding landscape of Indian startups. The scripts ensure data integrity by removing duplicates, handling null values, and enhancing dataset usability through industry classification. The Power BI visualizations provide insights into trends and patterns in the startup ecosystem.

## Data Cleaning and Standardization

### Removing Duplicates
1. **Create a Staging Table**: Create a staging table identical to the original dataset to work on the data without affecting the original.
2. **Insert Data into Staging Table**: Copy data from the original table to the staging table.
3. **Identify and Remove Duplicates**: Identify duplicate records using a Common Table Expression (CTE) with the ROW_NUMBER function and then remove them.

### Standardizing Data
1. **Rename Columns**: Rename columns for consistency and to follow naming conventions.
2. **Trim Whitespace**: Remove leading and trailing whitespace in text fields.
3. **Standardize Specific Values**: Standardize common values (e.g., different spellings of startup names and city names).

### Handling Null or Blank Values
1. **Identify Null or Blank Values**: Run queries to find records with null or blank values.
2. **Update Null or Blank Values**: Update these values to more meaningful default values or infer from other related records where possible.

### Cleaning Up Specific Columns
1. **Industry Column**: Update missing values by inferring from other records with the same startup name.
2. **SubVertical Column**: Apply similar cleaning steps to the SubVertical column.
3. **City Column**: Standardize city names and correct common misspellings.
4. **Investors and Investment Type Column**: Remove unnecessary characters and standardize entries.
5. **Date Column**: Change the data type after correcting some of the values.

### Special Handling of Amount_USD Column
1. **Reduce Values Temporarily**: Divide values in the Amount_USD column by 1000 to make them manageable.
2. **Alter Column Type**: Modify the column type to FLOAT.
3. **Restore Original Values**: Multiply the values back by 1000 to restore their original scale.

### Industry Sector Classification
1. **Industry Classification**: Execute queries to categorize industries based on keywords related to sectors such as Food and Beverages, Agriculture, Automotive, Healthcare, Finance, Education, Hospitality, E-Commerce, Gaming, Transportation and Logistics, Fashion, Real Estate, Technology, Sustainability, and Services.
2. **Handling Null or 'nan' Industries**: Identify and update any industries marked as 'nan' or null to a more meaningful category ('Other').
3. **Final Cleanup and Sector Assignment**: Assign 'Other' to any remaining null sectors, review distinct sectors, and update the original funding dataset with the newly classified sectors.

## Funding Analysis and Visualization

### Power BI Visualizations
The visualizations are created using Power BI and are stored in the `India Startup's Funding Analysis.pbix` file. The report includes:
- **Funding Trends Over Time**: Line and bar charts showing the trends in funding amounts over different periods.
![Screenshot 2024-07-16 154317](https://github.com/user-attachments/assets/32347dd0-d245-49c3-ac5c-c2f9c1161583)

- **Sector Distribution**: Bar charts illustrating the distribution of funded startups across various sectors.
![Screenshot 2024-07-16 154414](https://github.com/user-attachments/assets/753db789-d765-495c-a665-c153a249b147)

- **Geographical Distribution**: Maps and bar charts showing the distribution of startups and funding amounts across different cities in India.
![Screenshot 2024-07-16 154638](https://github.com/user-attachments/assets/1343313a-dc88-4eaf-9e5e-cf5ad6780b3c)

- **Investor Analysis**: Detailed views of the most active investors, types of investments they make, and their investment patterns.
![Screenshot 2024-07-16 154733](https://github.com/user-attachments/assets/9f02d2d7-3884-47df-9997-89db053498df)

- **Investment Types**: Analysis of different types of investments, such as Seed Funding, Series A, Series B, etc.
![Screenshot 2024-07-16 154826](https://github.com/user-attachments/assets/6209e142-d3e3-4f9d-b703-7397bfb69220)

### Insights
The analysis provides several key insights, including:
- **Funding Growth**: Understanding how startup funding has evolved over time.
- **Secotrs Hotspots**: Identifying which sectors and sub-verticals are attracting the most funding.
- **City-Level Analysis**: Discovering which cities are the major hubs for startup activity.
- **Investor Patterns**: Analyzing the behavior and focus areas of key investors in the ecosystem.
- **Funding Rounds**: Understanding the distribution and trends in different types of investment rounds.
