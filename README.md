

---

# 📈 Stock Market Data Analysis (SQL + Power BI)

This project analyzes **13 years of historical stock data** for major companies using **SQL (MariaDB)** and visualizes insights through **Power BI dashboards**.
It includes SQL code to create unified views, perform data aggregation, identify significant price movements, and prepare data for BI tools.

---

## 🚀 **Features**

* Merges individual stock tables into a single view for simplified querying.
* Calculates:

  * Latest closing prices for each company
  * Highest single-day close price across companies
  * Average trading volume per company
  * Yearly average closing prices
  * Days with >5% price drop from open to close
  * Daily close price comparisons between selected companies (e.g., AAPL vs MSFT)
* Exports results as CSV files ready for Power BI or other data visualization tools.

---

## 🛠 **Technologies Used**

* **MariaDB / SQL**
* **Power BI**
* (Optional) Python (for additional data processing / automation)

---

## 📂 **Project Structure**

```
/sql
  └── stock_analysis.sql         # Combined SQL script for all analysis + exports
/powerbi
  └── dashboard.pdf           # Power BI dashboard file 
/data
  └── used dataset - csv data
README.md
```

---

## ⚡ **Getting Started**

1️⃣ Load stock data into individual MariaDB tables (e.g., `AAPL`, `MSFT`, `JNJ`).
2️⃣ Run `sql/stock_analysis.sql` to:

* Create a unified view
* Generate and export analytical outputs as CSVs

3️⃣ Import CSVs into Power BI for visualization.

---

## 💡 **Example Insights**

* Trends in closing prices across years
* Volume patterns for high-frequency stocks
* Identification of major daily price drops
* Comparison of daily performance between key companies

---

## 📊 **Power BI Dashboard**

The Power BI dashboard visualizes:

* Time series of closing prices
* Bar charts of average volumes
* Heat maps of yearly price averages
* Tables of significant price drop days
* Comparison charts for selected companies

---

## 🙌 **Contributing**

Feel free to submit issues or pull requests to enhance the queries, support more stocks, or extend visualization templates!


