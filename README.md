# ⚡ Smart City Energy Analytics Dashboard

A Power BI dashboard project that analyzes smart city electricity consumption using smart meter data.  
The dashboard provides interactive insights into energy usage, outages, costs, and meter health across different city zones and consumer types.

---

## 📊 Project Overview

This project uses a smart city energy dataset to design an **interactive Power BI dashboard** that helps city administrators and energy providers:

- Monitor total energy consumption
- Analyze monthly usage trends
- Compare energy usage by consumer type
- Track power outages
- Estimate electricity costs
- Identify faulty smart meters using conditional formatting

---

## 🗂 Dataset Details

**File:** `SmartCityEnery.csv`

### Columns Description:
| Column Name | Description |
|------------|-------------|
| MeterID | Unique identifier for each smart meter |
| Zone | City zone (Central, East, West, North, South) |
| ConsumerType | Residential / Commercial / Industrial |
| Date | Energy reading date |
| EnergyConsumed_kWh | Total energy consumed in kWh |
| PeakUsage_kWh | Maximum kWh drawn in a single hour |
| OutageMinutes | Power outage duration (minutes) |
| MeterStatus | Active / Faulty |
| TariffRate | Electricity cost per kWh |

---

## 📈 Dashboard Features (Compulsory Requirements)

### 1️⃣ Geo Heatmap – Energy Use by Zone
- Visualizes total energy consumption across city zones
- Helps identify high-demand regions

### 2️⃣ Line Chart – Monthly Energy Consumption Trend
- Displays month-wise kWh usage
- Zone-wise comparison using legends

### 3️⃣ Bar Chart – Energy Usage by Consumer Type
- Compares Residential, Commercial, and Industrial consumption

### 4️⃣ KPI Cards
- **Total Consumption (kWh)**
- **Average Peak Usage (kWh)**
- **Total Outage Minutes**
- **Total Estimated Cost (₹)**

### 5️⃣ Interactive Slicers
- Zone
- Consumer Type
- Date Range

---

## 🧠 DAX Measures Used

```DAX
Total Consumption (kWh) =
SUM(SmartCityEnery[EnergyConsumed_kWh])

Avg Peak Usage (kWh) =
AVERAGE(SmartCityEnery[PeakUsage_kWh])

Total Outage Minutes =
SUM(SmartCityEnery[OutageMinutes])

Total Estimated Cost (₹) =
SUMX(
    SmartCityEnery,
    SmartCityEnery[EnergyConsumed_kWh] * SmartCityEnery[TariffRate]
)
