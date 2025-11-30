# Automated-Market-Risk-Monitor-NVIDIA-vs-Gold-
In a market dominated by AI hype, I built an end-to-end data pipeline to quantify the real risk of high-growth assets. The goal: scientifically compare the volatility of NVIDIA (AI Tech) against Gold (Safe Haven) and the S&amp;P 500.
English version below !!

# 📉 Analyse Automatisée du Risque Financier (NVIDIA vs Or)

![Aperçu du Dashboard](dashboard_preview.png)
*(Note : Ceci est un aperçu du Dashboard Tableau construit pour ce projet)*

## 📖 L'Histoire derrière les chiffres
On parle souvent de "Risque" en finance, mais à quoi cela ressemble-t-il concrètement ?

Avec l'explosion de l'IA, j'ai voulu répondre à une question simple :
**"À quel point une action en hyper-croissance comme NVIDIA est-elle plus dangereuse qu'une valeur refuge comme l'Or ?"**

Au lieu d'utiliser des fichiers Excel statiques, j'ai construit un **pipeline de données automatisé** (Python & SQL) pour mesurer ce risque scientifiquement. J'ai calculé le "facteur peur" du marché (la Volatilité) et la perte maximale probable (la VaR).

## 💡 Verdict (Ce que disent les données)
En regardant le dashboard, l'histoire est claire :
* **NVIDIA, c'est les montagnes russes :** Une volatilité annualisée **3x supérieure** à l'Or. Les gains sont élevés, mais le risque est extrême.
* **L'Or est le filet de sécurité :** Ses pertes sont limitées et stables, prouvant son rôle de "valeur refuge" (Safe Haven) en temps de crise.
* **Les Maths collent à la Réalité :** Le modèle a parfaitement identifié les périodes de stress majeur (Crash Covid 2020, Chute de la Tech 2022).

---

## 🛠️ Comment je l'ai construit (La Stack Technique)
J'ai utilisé une stack de données moderne pour automatiser l'analyse :

* **🐍 Python (Le Coursier) :**
    * J'ai écrit un script utilisant `yfinance` pour récupérer automatiquement 5 ans d'historique de prix.
    * Il nettoie les données et les formate pour la base de données.

* **🗄️ SQL / PostgreSQL (Le Cerveau) :**
    * C'est ici que les calculs se font. Pas de moyennes simples : j'ai utilisé des **Window Functions** (`LAG`) pour calculer les rendements journaliers.
    * J'ai calculé les métriques de risque complexes (**Écart-type** et **Percentiles**) directement dans la base de données.

* **📊 Tableau (Le Visage) :**
    * J'ai visualisé les résultats pour les rendre compréhensibles en un coup d'œil.
    * Le dashboard compare les "Zones de Danger" (VaR 95%) de chaque actif.

---

## 🔍 Zoom sur les Concepts Financiers
Pour les curieux de finance, voici ce que j'ai modélisé :

1.  **Volatilité Annualisée ($\sigma$) :** Est-ce que le prix bouge violemment ?
2.  **Value at Risk (VaR 95%) :** Le "Pire Scénario".
    * *Exemple :* Une VaR de -3.5% signifie que 95% du temps, la perte journalière ne dépassera pas 3.5%.

## 🚀 Comment lancer ce projet
Si vous voulez reproduire ces résultats :

1.  **Récupérer le code :** Clonez ce dépôt (repo).
2.  **Obtenir les données :** Lancez `python market_data_extract.py`. Cela générera un fichier CSV propre.
3.  **Traiter les données :** Chargez le CSV dans PostgreSQL et exécutez le script `risk_analysis.sql`.
4.  **Voir les résultats :** Connectez le fichier de sortie à Tableau ou PowerBI.

---
*Créé par **Emmanuel ENOH** – Data Analyst & Ingénieur

# 📉 Automated Market Risk Monitor (NVIDIA vs Gold)

![Dashboard Preview](dashboard_preview.png)
*(Note: This is a preview of the Tableau Dashboard built in this project)*

## 📖 The Story Behind the Data
Investors often talk about "Risk", but what does it actually look like in numbers?

With the AI boom, I wanted to answer a concrete question:
**"How much riskier is a high-growth stock like NVIDIA compared to a traditional safe haven like Gold?"**

Instead of using static Excel files, I built an **automated pipeline** using Python and SQL to measure this risk scientifically. I calculated the "fear factor" of the market (Volatility) and the maximum expected loss (Value at Risk).

## 💡 Key Findings (What the data says)
Looking at the dashboard, the data tells a clear story:
* **NVIDIA is a Rollercoaster:** It has an annualized volatility **3x higher** than Gold. High reward comes with extreme risk.
* **Gold is the Safety Net:** Its losses are capped and stable, proving its role as a "Safe Haven" during market crashes.
* **The Math Matches Reality:** The model successfully flagged the major market stress periods (2020 Covid Crash, 2022 Tech Sell-off).

---

## 🛠️ How I Built It (The Tech Stack)
I used a modern data stack to automate the analysis:

* **🐍 Python (The Courier):**
    * I wrote a script using `yfinance` to automatically fetch 5 years of daily stock prices.
    * It cleans the data and formats it for the database.

* **🗄️ SQL / PostgreSQL (The Brain):**
    * This is where the math happens. I didn't calculate averages; I used **Window Functions** (`LAG`) to calculate daily returns.
    * I computed complex risk metrics like **Standard Deviation** and **Percentiles** directly in the database.

* **📊 Tableau (The Face):**
    * I visualized the results to make them understandable at a glance.
    * The dashboard compares the "Danger Zones" (VaR 95%) of each asset.

---

## 🔍 Deep Dive: The Financial Concepts
For the finance geeks, here is what I modeled:

1.  **Annualized Volatility ($\sigma$):** How wildly does the price swing?
2.  **Value at Risk (VaR 95%):** The "Worst Case Scenario".
    * *Example:* A VaR of -3.5% means that 95% of the time, the daily loss won't exceed 3.5%.

## 🚀 How to Run this Project
If you want to reproduce these results:

1.  **Get the code:** Clone this repo.
2.  **Get the data:** Run `python market_data_extract.py`. It will generate a clean CSV file.
3.  **Process the data:** Load the CSV into PostgreSQL and run the `risk_analysis.sql` script.
4.  **See the results:** Connect the output to Tableau or PowerBI.

---
*Created by **Emmanuel ENOH** – Data Analyst & Engineer*
*[Connect with me on LinkedIn](https://www.linkedin.com/in/ton-profil)*
