# 🌊 Meridian Sales Analytics
### Commercial Analytics Project — PT Meridian Pangan Global

![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=flat&logo=postgresql&logoColor=white)
![Tableau](https://img.shields.io/badge/Tableau-E97627?style=flat&logo=tableau&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat&logo=python&logoColor=white)
![Status](https://img.shields.io/badge/Status-Completed-brightgreen)

---

## 📌 Project Overview

This project analyzes FY2025 order-level sales data for **PT Meridian Pangan Global (MPG)**, a specialty food & beverage trading company distributing premium beverages, dairy, confections, and gourmet goods to retail, HORECA, and distribution partners across Europe and beyond.

Q4 2025 closed with **$280K in revenue across 179 orders, up 62% quarter-over-quarter** — but average order value fell 10% within the quarter, leaving an estimated **$17.4K in Q4 revenue unrealized**, and growth is concentrated in a narrow base of products, sales reps, and repeat accounts.

This analysis identifies where that basket-size gap comes from, how concentrated Meridian's growth really is, and delivers actionable recommendations projected to **recover AOV to the $1,661 peak and broaden the revenue base within 2 quarters**.

---

## ❓ Problem Statement

Meridian Pangan Global's Q4 2025 order volume grew 62% quarter-over-quarter, but average order value fell 10% within the quarter, and revenue remains concentrated in a narrow base of products, sales reps, and repeat accounts — with no structured monitoring in place to catch these patterns early.

---

## 🎯 SMART Objective

To identify the structural drivers behind Q4's basket-size erosion and revenue concentration, and deliver data-driven recommendations to recover AOV to the **$1,661 peak** and broaden the revenue base — measured through a real-time monitoring dashboard within **2 quarters**.

---

## 🔍 Key Findings

| # | Finding | Impact |
|---|---------|--------|
| 1 | **AOV peaked at $1,661 in November, fell 10% to $1,494 in December** — the lowest point of Q4 despite the highest order volume | ~$17.4K in Q4 revenue left unrealized (6.2% of quarterly revenue) |
| 2 | **United Package (39% of shipment volume) posts a 5.08% late rate**, just above the 5% strong-performance benchmark | Reliability risk concentrated in the highest-volume courier |
| 3 | **Top 3 products generate 52% of top-10 revenue** ($293K of $559K); Côte de Blaye alone is $141K | Revenue exposed to single-product demand/supply shifts |
| 4 | **Top 3 of 9 sales reps drive 49% of all orders** (406 of 830) | Key-person dependency on 3 individuals |
| 5 | **Loyal customers generate 93.79% of revenue; new accounts order at 51% smaller basket size** ($811 vs. $1,647 AOV) | Thin, slow-ramping acquisition engine |

---

## 💡 Recommendations

**1. Basket Size (AOV) — Recover ~$17K per quarter**
- Introduce a volume-discount tier just above current AOV (~$1,700+)
- Bundle hero products (e.g. Côte de Blaye) with adjacent-category items at order time
- *Tool: pricing tier model, bundle recommendation rules*

**2. Delivery Reliability (Shipper SLA)**
- Rebalance peak-season volume from United Package toward Federal Shipping (strongest performer, 3.61% late rate)
- Formal quarterly SLA scorecards tied to the 95%+ on-time benchmark

**3. Product Revenue Concentration**
- Track a "rising star" watchlist of products just outside the top 10 for targeted promotion
- Anchor-bundle top-3 hero products with adjacent-category items

**4. Sales Team Concentration**
- Pair top-3 reps with lower-volume reps in a structured mentorship program
- Review account distribution so growth accounts aren't concentrated with only 3 reps

**5. New Account Growth**
- Launch a structured 30-60-90 new-account ramp playbook targeting basket-size growth
- Review the acquisition funnel — only 15 new accounts were added against a 74-account active base

Full detail in [`06_action/recommendations.md`](06_action/recommendations.md).

---

## 💰 Business Impact

| Metric | Value |
|--------|-------|
| FY2025 Revenue (12 months) | $744K |
| Q4 2025 Revenue | $280K (179 orders) |
| Q4 QoQ Growth | +62% |
| Peak Average Order Value (Nov 2025) | $1,661 |
| Q4 Actual Average Order Value | $1,564 |
| Q4 Opportunity Cost (AOV erosion) | ~$17.4K (6.2% of quarterly revenue) |
| Blended Courier Late Rate | 4.57% |
| Loyal Customer Revenue Share | 93.79% |
| **Target: AOV Recovery** | **$1,661+ within 2 quarters** |

*(Recovery assumes AOV is restored to and sustained at the November 2025 peak level across quarterly order volume.)*

---

## 🛠 Tools & Methodology

| Stage | Tool | Activity |
|-------|------|----------|
| Data Source | PostgreSQL | Northwind Traders practice dataset, loaded locally via DBeaver |
| Data Verification | Python (DuckDB) | Row-count checks, referential integrity, cross-validation of every query output against source CSVs |
| Sales Performance | PostgreSQL | Monthly trend, AOV calculation, quarter-over-quarter comparison |
| Delivery SLA | PostgreSQL | Late-rate calculation via `CASE WHEN`, per-courier aggregation |
| Product & Rep Analysis | PostgreSQL | Revenue ranking, concentration share (Pareto-style) |
| Customer Segmentation | PostgreSQL | New vs. loyal via first-order-date CTE logic |
| Dashboard | Tableau | Real-time commercial performance monitoring (KPI cards, bar charts, trend view) |
| Communication | PowerPoint | 29-slide executive analytics deck with native charts |

---

## 📊 Analysis Deep Dive

### Layer 1 — Monthly Performance & AOV

| Metric | Value |
|--------|-------|
| Q4 Revenue Range | $83K (Nov) → $108K (Dec) |
| Q4 Order Count Range | 50 (Nov) → 72 (Dec) |
| Peak AOV | $1,661 (November) |
| Lowest Q4 AOV | $1,494 (December) |

**Critical Insight:** year-end demand is real — order count hit its yearly high in December — but it's increasingly carried by smaller, more frequent orders rather than larger baskets. Seasonal volume isn't yet being monetized to its full potential.

### Layer 2 — Delivery Reliability (Shipper SLA)

| Courier | Shipped Orders | Late Orders | Late Rate |
|---------|----------------|--------------|-----------|
| United Package | 315 | 16 | 5.08% |
| Speedy Express | 245 | 12 | 4.90% |
| Federal Shipping | 249 | 9 | 3.61% |

**Critical Insight:** reliability risk is concentrated exactly where volume is highest. United Package carries 39% of all shipments and is the only courier above the 5% late-rate threshold generally considered strong performance.

### Layer 3 — Revenue Concentration (Products, Sales Reps, Customers)

- **Products:** the top 3 of the top-10 products (Côte de Blaye, Thüringer Rostbratwurst, Raclette Courdavault) account for 52% of top-10 revenue ($293K of $559K).
- **Sales Reps:** 3 of 9 reps (Margaret Peacock, Janet Leverling, Nancy Davolio) drive 49% of all 830 orders.
- **Customers:** loyal customers (74 of 89 active accounts) generate 93.79% of FY2025 revenue; the 15 new accounts added this year order at less than half the basket size of loyal accounts ($811 vs. $1,647 AOV).

**Critical Insight:** all three concentration patterns point the same direction — Meridian's current revenue engine is efficient but narrow. Growth today depends on a small set of hero products, a handful of top reps, and an established customer base, with a comparatively thin pipeline of new products, reps, and accounts behind them.

---

## 📊 Deck Preview

### Executive Summary
![Executive Summary](05_communication/screenshots/01_executive_summary.png)

### Monthly Performance & AOV Deep Dive
![Monthly Performance & AOV](05_communication/screenshots/02_monthly_performance_aov.png)

### Commercial Performance Dashboard (Tableau)
![Dashboard Preview](05_communication/screenshots/03_dashboard_preview.png)

Full 29-slide deck: [`deck/Meridian_Sales_Analytics_Deck.pptx`](deck/Meridian_Sales_Analytics_Deck.pptx)

---

## 📁 Data Model

**7 tables used** — `orders` and `order_details` as the transactional core, joined out to 5 supporting reference tables.

```
customers    ──┐
employees    ──┤
shippers     ──┼──  orders  ──  order_details  ──┐
                                                   ├── products ── categories
                                                   ┘
```

| Table | Rows | Description |
|-------|------|-------------|
| orders | 830 | Order header: customer, employee, dates, courier, freight |
| order_details | 2,155 | Line-item detail: product, unit price, quantity, discount |
| products | 77 | Product master: name, category, unit price |
| categories | 8 | Product category master |
| employees | 9 | Sales rep / staff master |
| shippers | 6 | Courier master (3 with shipped-order activity) |
| customers | 91 | Customer / account master |

Full column-level documentation in [`02_data_discovery/data_dictionary.md`](02_data_discovery/data_dictionary.md).

**Data Period:** FY2025 (order-date normalized — see [`03_data_preparation/data_preparation.md`](03_data_preparation/data_preparation.md))
**Dataset:** Northwind Traders (public SQL practice dataset); business narrative and company name are illustrative.

---

## 🔑 SQL Techniques Used

| Technique | Applied In |
|-----------|-----------|
| `EXTRACT(MONTH/YEAR FROM ...)` | Monthly trend grouping (T1) |
| Conditional aggregation (`CASE WHEN`) | Late-order flagging (T2), big-order flagging (T4), price-range bucketing (T3) |
| Multi-column `GROUP BY` with derived buckets | Top-product ranking with price range (T3) |
| CTEs (`WITH ... AS`) | Sales rep order totals (T4), first-order-date + revenue pipeline (T5) |
| `CONCAT()` | Full-name construction (T4) |
| `ROUND(...::numeric, n)` | Consistent 2-decimal rate/value formatting |
| `ORDER BY` multi-key with `DESC` | Scorecard ranking (T4) |

---

## 📁 Project Structure

```
meridian-sales-analytics/
├── 01_define/
│   └── business_brief.md
├── 02_data_discovery/
│   └── data_dictionary.md
├── 03_data_preparation/
│   └── data_preparation.md
├── 04_analysis/
│   └── sql/
│       ├── schema/
│       │   └── 01_create_tables.sql
│       └── queries/
│           ├── 01_monthly_performance.sql
│           ├── 02_shipper_sla.sql
│           ├── 03_top_products.sql
│           ├── 04_sales_rep_scorecard.sql
│           └── 05_new_vs_loyal.sql
├── 05_communication/
│   └── screenshots/
│       ├── 01_executive_summary.png
│       ├── 02_monthly_performance_aov.png
│       └── 03_dashboard_preview.png
├── 06_action/
│   └── recommendations.md
├── data/
│   └── raw/
│       ├── orders.csv
│       ├── order_details.csv
│       ├── products.csv
│       ├── categories.csv
│       ├── employees.csv
│       ├── shippers.csv
│       └── customers.csv
├── deck/
│   └── Meridian_Sales_Analytics_Deck.pptx
└── README.md
```

---

## 🎯 6-Month Implementation Roadmap

**Phase 1: Implement (Month 1–2)**
- Launch tiered pricing & bundle offers
- Rebalance courier allocation
- Launch new-account ramp playbook

**Phase 2: Monitor (Month 3–4)**
- Track AOV, SLA & concentration via dashboard
- Validate rising-star products
- Track mentorship pairing progress

**Phase 3: Evaluate (Month 5–6)**
- Measure AOV recovery vs. $1,661 target
- Adjust strategies if needed
- Report revenue diversification to stakeholders

---

## 🔗 Connect

**Deleonard Simanjorang**
Data Analyst | People & Commercial Analytics

📧 deleonard20@gmail.com
💼 [LinkedIn](https://www.linkedin.com/in/deleonard-simanjorang)
📱 WhatsApp: +62 812 4154 4992
🐙 [GitHub](https://github.com/deleonard20)

---

**⭐ If you found this analysis helpful, please consider starring this repository!**
