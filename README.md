# FMCG Brewery Sales Analysis (SQL) 
This analysis was conducted on an international FMCG brewery sales dataset (1,047 transaction records) covering Anglophone (Ghana, Nigeria) and Francophone (Benin, Senegal, Togo) West African markets across 2017–2019, spanning brands, regions, sales reps, and profitability.

## 🔍 Overview This project performs exploratory and business-driven analysis on FMCG brewery sales data using SQL. 21 SQL queries were developed to answer key business questions related to overall profitability, territory and country performance, seasonal trends, brand consumption, regional preferences, and sales rep performance.

The goal is to uncover actionable insights that support market strategy, promotional planning, and resource allocation decisions across the brewery's West African operations — prepared for the Territory Manager as evidence for 2020 strategic decisions.

## 📌 Objectives

- Explore and understand the structure of the FMCG sales dataset using SQL
- Analyse profitability trends across years, months, and territories
- Identify top-performing and underperforming brands by country and region
- Evaluate regional consumption patterns to support promo and distribution decisions
- Assess sales rep performance for high-value brands
- Generate data-driven insights to support strategic decision-making across Anglophone and Francophone markets

## ❓ Business Questions

- Total profit worth of the breweries (Anglophone + Francophone), 2017–2019
- Total profit: Anglophone vs Francophone territory
- Country with the highest profit in 2019
- Year with the highest profit
- Month with the least profit generated (2017–2019 combined)
- Minimum profit recorded in December 2018
- Monthly profit share (%) for 2019
- Brand generating the highest profit in Senegal
- Profit trend over the months (chronological, all years)
- Top 3 brands consumed in Francophone countries (2018–2019)
- Top 2 consumer brands in Ghana
- Beers consumed in the past 3 years in Nigeria
- Favorite malt brand in the Anglophone region (2018–2019)
- Brands that sold the highest in 2019 in Nigeria
- Favorite brand in the South-South region of Nigeria
- Beer consumption in Nigeria (all years, all brands excluding malt)
- Budweiser consumption by region in Nigeria (all years)
- Budweiser consumption by region in Nigeria, 2019 (promo decision)
- Country with the highest beer consumption
- Highest-performing Budweiser sales personnel in Senegal
- Country with the highest profit in Q4 2019 (Oct–Dec)

## 📚 Dataset Description Source: International_fmcg_sql_assessment.csv  1,047 sales transaction records, 2017–2019. Table: fmcg_sales Columns: COUNTRIES, YEARS, MONTHS, REGION, BRANDS, SALES_REP, QUANTITY, PROFIT. Countries: Ghana, Nigeria (Anglophone); Benin, Senegal, Togo (Francophone). Regions (within country): Southeast, Northcentral, Northeast, Northwest, Southsouth, West. Brands: Beer — Budweiser, Castle Lite, Eagle Lager, Hero, Trophy. Malt (non-alcoholic)  Beta Malt, Grand Malt. Currency: All profit figures in Naira (N), native/unmodified.

## 🧹 Data Cleaning and Preparation

Territory classification derived via a CASE statement: Ghana and Nigeria grouped as Anglophone, all other countries grouped as Francophone.
Malt brands (Beta Malt, Grand Malt) excluded from beer-specific consumption queries using NOT IN filters, since they are non-alcoholic.
Chronological month ordering handled via a CASE statement mapping month names to numeric order (Q7, Q9), since MONTHS is stored as text.
"Consumption," "sold the highest," and "favorite brand" measured by total QUANTITY, not profit, unless the question explicitly asks about profit.
Analytical assumptions documented up front: Nigeria treated as the "most oil-rich" country (Q12); "past two/three years" read as 2018–2019 / 2017–2019, since 2019 is the latest year in the data; the dataset contains no 2020 records, so the Q2 territory comparison serves as the evidence base for 2020 planning.

## 📈 Key Findings

- Total Profit (2017–2019): N105,587,420 combined profit across all three years and both territories.
- Anglophone vs Francophone Profit: Francophone (Benin, Senegal, Togo) leads with N63,198,160 versus Anglophone's (Ghana, Nigeria) N42,389,260  a gap of nearly N20.8M.
- Top Country, 2019: Ghana, at N7,144,070.
- Best Year: 2017, at N38,503,320 — the strongest of the three years.
- Weakest Month (all years): April, at N8,573,830 cumulative across 2017–2019.
- Min Profit, Dec 2018: N38,150 (smallest single transaction).
- 2019 Monthly Profit Share: January led at 10.87% of 2019 profit; February was weakest at 4.55%.
- Top Brand in Senegal: Castle Lite, at N7,012,980.
- Profit Trend Over Time: Full 36-month series (Jan 2017–Dec 2019) built for trend/seasonality visualization; profit is front-loaded toward 2017, tapering into 2019.
- Top 3 Francophone Brands (2018–2019): Trophy (52,899 units), Hero (50,846), Eagle Lager (50,630)  tightly clustered.
- Top 2 Brands in Ghana: Eagle Lager (25,829 units) narrowly ahead of Castle Lite (25,806).
- Beer Consumption in Nigeria: Budweiser leads by volume (26,153 units) but volumes are tightly spread across all five beer brands (25,681–26,153); Castle Lite and Budweiser are the most profitable per unit.
- Favorite Malt Brand (Anglophone, 2018–2019): Grand Malt, at 33,221 units.
- Top-Selling Nigeria Brands, 2019: Hero (9,622), Eagle Lager (8,401), Beta Malt (8,389), Grand Malt (8,125), Trophy (5,803), Budweiser (5,490), Castle Lite (3,388 — lowest).
- Favorite Brand, South-South Nigeria: Eagle Lager, at 4,551 units.
- Nigeria Beer Consumption (all years): Budweiser (26,153), Eagle Lager (25,872), Hero (25,811), Trophy (25,743), Castle Lite (25,681) — all five brands within ~470 units of each other.
- Budweiser by Region, Nigeria (all years): West leads (4,620), Southeast trails (4,113)  a fairly even spread.
- Budweiser by Region, Nigeria, 2019: Southeast jumps to first (1,821 units  more than double any other region); Southsouth is weakest (847).
- Highest Beer-Consuming Country: Senegal, at 129,875 units  the clear national leader.
- Top Budweiser Sales Rep, Senegal: Jones  5,917 units, N1,479,250 profit.
- Top Country, Q4 2019: Ghana, at N2,045,230.

## 📊 Business Insights

🌍 The Francophone territory is the stronger business, and the gap is material. Francophone markets (Benin, Senegal, Togo) generated N63,198,160 against Anglophone's N42,389,260 — roughly 49% more profit from three countries versus two. Since no 2020 data exists yet, this three-year trend is the strongest available evidence for Mr. Stone's 2020 planning: it supports weighting incremental investment toward Francophone markets while investigating what's holding Anglophone back (pricing, distribution reach, or brand mix).

📉 Profit is declining year over year. 2017 was the peak year (N38,503,320); profit has trended down since, based on the monthly series in Q9. This is a bigger concern than any single country or brand result  a shrinking topline across three straight years warrants root-cause investigation (market saturation, competitor entry, pricing pressure) before territory-level tactics can be expected to move the needle.

🍺 Beer brand competition in Nigeria is essentially a five-way tie. Across all years, Budweiser, Eagle Lager, Hero, Trophy and Castle Lite sit within roughly 470 units of each other (25,681–26,153). No single brand dominates Nigeria by volume, though Budweiser and Castle Lite convert that volume into meaningfully higher profit suggesting margin, not distribution reach, is what currently separates the brands in Nigeria.

📍 The Budweiser regional promo picture inverts between the full period and 2019 alone. Over 2017–2019, Budweiser consumption in Nigeria is nearly flat by region (West leads narrowly at 4,620 vs Southeast's 4,113). But in 2019 specifically, Southeast surges to 1,821 units  more than double every other region — while it was previously the weakest. This is the single most actionable regional signal in the dataset: a promo decision based on the multi-year average would miss the region that's actually accelerating right now.

🇸🇳 Senegal is the volume engine of the business. At 129,875 units, Senegal's beer consumption outpaces every other country by a wide margin, and it also houses the top-profit brand (Castle Lite, N7,012,980) and the top-performing Budweiser sales rep (Jones, 5,917 units / N1,479,250). Senegal is not just a Francophone contributor  it's the single most important market in the dataset on both volume and rep-performance evidence.

## 📉 Notable Trends

- Seasonality is real but modest: April is consistently the weakest month (N8,573,830 across all years combined), while January is 2019's strongest single month (10.87% of that year's profit)  pointing to a post-holiday demand pattern worth planning promotions and inventory around.
- Malt vs. beer split favours Grand Malt in Anglophone markets (33,221 vs. Beta Malt over 2018–2019), while beer brand preference in Nigeria stays essentially flat across brands — the malt segment shows clearer brand loyalty than the beer segment does.
- Ghana punches above its Anglophone-territory weight: despite Anglophone trailing Francophone overall, Ghana still tops both the 2019 country ranking (N7,144,070) and the Q4 2019 ranking (N2,045,230) — Nigeria, not Ghana, appears to be the larger drag on Anglophone's territory total.

## 💡 Recommendations

- Weight 2020 investment toward Francophone markets, particularly Senegal, given its volume dominance (129,875 units), top-profit brand, and top-performing sales rep — while opening a parallel workstream to diagnose Nigeria's relative underperformance within Anglophone.
- Investigate the 2017→2019 profit decline before committing to territory-level tactics; a shrinking topline needs a root-cause read (pricing, competition, distribution) that this query set alone can't confirm.
- Target the Southeast Nigeria region for Budweiser promo spend, using the 2019-specific data rather than the multi-year average — Southeast's 2019 surge (1,821 units, more than 2x any other region) is the more current and decisive signal.
- Plan around the April dip and January peak in promotional and inventory calendars, given the consistent seasonal pattern across all three years.
- Treat Castle Lite and Budweiser as Nigeria's margin leaders and consider whether their pricing/positioning can be extended to the other three beer brands, which move similar volume but convert it to less profit.
