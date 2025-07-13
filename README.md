# Swiggy Business Analyst Case Study – Himanshu Kumar

## 📌 Problem Statement

Swiggy is looking to reward the **top 5 delivery executives** in each city every week based on their performance. As a Business Analyst, your task is to design a framework that allows easy identification of these top performers using order delivery data.

---

## 🛠️ Tools & Technologies Used

- **Python (Pandas, Faker)** – To generate a realistic 100K+ row delivery dataset
- **PostgreSQL** – To perform weekly aggregation and scoring of delivery agents
- **Excel** – To build an interactive dashboard with city-level filtering and visualizations

---

## 📈 Performance Scoring Logic

Each delivery executive is scored weekly using a custom business formula:

score = 0.4 × total_orders + 0.3 × order_value + 0.3 × (average_rating × 20)
## 📂 Repository Structure
├── swiggy_data_generation.py # Python script to generate synthetic delivery data.
├── swiggy_analysis_queries.sql # SQL views and ranking logic using PostgreSQL.
├── Swiggy_Dashboard_Himanshu.xlsx # Final Excel dashboard with dropdown and chart.
├── Swiggy_CaseStudy_Summary_Himanshu.pdf # 1-page summary of approach and methodology.
