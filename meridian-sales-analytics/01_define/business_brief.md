# Business Brief — Sales & Revenue Performance Analysis

## Company

**PT Meridian Pangan Global (MPG)** is a specialty food & beverage trading company sourcing premium beverages, dairy, confections, and gourmet goods for retail, HORECA, and distribution partners across Europe and beyond.

## Business Context

Management wants a **Q4 2025 executive brief** to close the quarter with the right strategy. They need to see monthly sales momentum, check delivery quality (SLA) so complaints don't rise, focus on the products that genuinely drive revenue, assess sales rep performance, and understand the new-vs-loyal customer split so marketing and retention decisions are sharper.

## Problem Statement

Meridian Pangan Global's Q4 2025 order volume grew 62% quarter-over-quarter, but average order value fell 10% within the quarter, and revenue remains concentrated in a narrow base of products, sales reps, and repeat accounts — with no structured monitoring in place to catch these patterns early.

## SMART Objective

To identify the structural drivers behind Q4's basket-size erosion and revenue concentration, and deliver data-driven recommendations to recover AOV to the **$1,661 peak** and broaden the revenue base — measured through a real-time monitoring dashboard within **2 quarters**.

## 5 Analysis Pillars

| # | Pillar | Business Question | Tables |
|---|--------|-------------------|--------|
| T1 | Monthly Performance | What is the order count, revenue, and AOV per month in FY2025? | `orders`, `order_details` |
| T2 | Shipper SLA | For shipped orders, what is the late rate per courier? | `orders`, `shippers` |
| T3 | Top 10 Products | Which 10 products generate the most revenue, and in what price range? | `orders`, `order_details`, `products`, `categories` |
| T4 | Sales Rep Scorecard | Per employee: order count, AOV, and % of big orders (>$1,000)? | `orders`, `order_details`, `employees` |
| T5 | New vs Loyal Customers | How does order volume and revenue split between new (first order in 2025) and loyal (first order before 2025) customers? | `orders`, `order_details` |

## In Scope

Revenue and order trend analysis (FY2025), shipper SLA across all shipped orders, product revenue ranking (all-time), sales rep performance (all-time), and customer segmentation (new vs. loyal, FY2025 revenue).

## Out of Scope

Product cost/margin analysis, marketing channel attribution, and individual employee performance review beyond order metrics — excluded to keep focus on order, revenue, and fulfillment structure.

## Tools

- **PostgreSQL (DBeaver)** — data extraction, cleaning & analysis
- **Tableau** — dashboard development & monitoring

## Stakeholder

Commercial / Sales leadership — Q4 close review.
