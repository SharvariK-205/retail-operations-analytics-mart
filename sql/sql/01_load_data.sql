CREATE TABLE stores AS
SELECT * FROM read_csv_auto('data/raw/stores.csv');

CREATE TABLE daily_sales AS
SELECT * FROM read_csv_auto('data/raw/daily_sales.csv');

CREATE TABLE staffing AS
SELECT * FROM read_csv_auto('data/raw/staffing.csv');

CREATE TABLE complaints AS
SELECT * FROM read_csv_auto('data/raw/complaints.csv');

CREATE TABLE promotions AS
SELECT * FROM read_csv_auto('data/raw/promotions.csv');

CREATE TABLE targets AS
SELECT * FROM read_csv_auto('data/raw/targets.csv');