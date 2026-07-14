# Retail Operations Analytics Mart – Project Scope

## 1. Business Problem

Regional and operations managers need a clear view of which stores are underperforming, why, and what actions to take. Right now, performance data is scattered across sales reports, staffing schedules, complaint logs, and promotion recaps, making it hard to trust the numbers or act quickly.

This project builds a single, analytics-ready data mart and KPI layer for retail operations performance.

## 2. Objectives

- Consolidate store-level data (sales, targets, staffing, complaints, promotions) into a single DuckDB analytics database.
- Define a clear, documented KPI layer for store performance (sales vs target, conversion proxy, sales per staff hour, complaint rate, promotion uplift).
- Surface underperforming stores and likely drivers (staffing, complaints, promo execution, etc.).
- Produce decision-ready views that a regional manager could realistically use in a monthly review.

## 3. Stakeholders (Hypothetical)

- **Regional Operations Manager** – wants to know which stores to focus on and why.
- **Store Manager** – needs to see how their store is performing vs target and peers.
- **Commercial/Finance Analyst** – needs consistent KPIs and reconciled numbers for reporting.
- **Head of Retail** – wants a high-level view of trends and risk areas.

## 4. KPIs (First Version)

- Total sales and sales vs target.
- Average basket size (sales / transactions, if available).
- Sales per staff hour.
- Complaint rate (complaints / 1,000 transactions or per day).
- Promotion uplift (promo period vs baseline).

These may evolve as I build the data model.

## 5. Data Sources (Planned)

- `stores` – store id, name, region, size, opening date.
- `daily_sales` – date, store id, sales, transactions.
- `staffing` – date, store id, staff hours, headcount.
- `complaints` – date, store id, complaint id, type, severity.
- `promotions` – promo id, store id or region, start/end date, promo type.
- `targets` – date, store id, target sales.

This project will start with synthetic or public data reshaped into these tables.

## 6. Scope & Non-Goals

**In scope**

- Local DuckDB database and SQL models.
- Clean staging and mart tables for store-level performance.
- Basic visualisation (dashboard/app) built on top of the mart.
- Documentation of assumptions and KPI definitions.

**Out of scope (for now)**

- Real company data.
- Complex forecasting or machine learning.
- Cloud deployment or production Orchestration.

## 7. Tools

- DuckDB (local analytics database).
- Python + pandas (data loading and utilities).
- SQL (core transformation logic).
- [Dashboard tool TBD – e.g. Streamlit or a BI tool for final views]