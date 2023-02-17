# sql-challenge
Leverage SQL to perform data modeling, data engineering, and data analysis

## Background

Research and data analysis was performed on a fictional company's employees from the 1980's and 1990's.  SQL tables were created to form a SQL database and values for each table were imported from source CSV files.  Data modeling, data engineering and data analysis were performed with the dataset. The resulting database contained 6 tables and data for over 300,000 employees including: first name, last name, age, sex, birth date, hire date, employee number, title, salary, department number, department name and manager.


## Approach

(1) A data model was developed to depict the Entity Relationship Diagram of the tables in the database leveraging QuickDBD.
(2) Table schemas were created for each table specifying the data types, primary keys, foreign keys and other contraints.
(3) Values for the tables were imported from the sourced CSV files (listed below).
(4) The data were analyzed using INNER JOINS, WHERE statements, ORDER BYs, COUNTs and other filters and constraints.
(5) Views were created to house the resulting outputs from step # 4 above.


## Sources used for this analysis

Six (6) csv files including:
    - departments.csv
    - dept_emp.csv
    - dept_manager.csv
    - employees.csv
    - salaries.csv
    - titles.csv
