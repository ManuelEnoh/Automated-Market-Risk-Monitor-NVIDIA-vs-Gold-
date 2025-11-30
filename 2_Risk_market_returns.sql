CREATE TABLE market_data (
    date DATE,
    ticker VARCHAR(10),
    close_price NUMERIC
);

-- On crée une VUE (une table virtuelle) pour stocker les calculs
-- Comme ça, Tableau pourra lire directement 'market_returns' plus tard
CREATE OR REPLACE VIEW market_returns AS

SELECT
    date,
    ticker,
    close_price,
    -- 1. On récupère le prix de la ligne précédente (J-1) pour le même ticker
    LAG(close_price) OVER (PARTITION BY ticker ORDER BY date) as previous_price,

    -- 2. On calcule la variation : (Prix Actuel - Prix Veille) / Prix Veille
    -- On multiplie par 100 pour avoir un pourcentage lisible
    ROUND(
        (close_price - LAG(close_price) OVER (PARTITION BY ticker ORDER BY date))
        / LAG(close_price) OVER (PARTITION BY ticker ORDER BY date) * 100,
    4) as daily_return_pct

FROM market_data
ORDER BY ticker, date DESC;

SELECT * FROM market_returns LIMIT 20;

SELECT
    ticker,
    COUNT(*) as trading_days,

  
    ROUND( (STDDEV(daily_return_pct) * SQRT(252))::numeric, 2) as volatility_annualized_pct,

    ROUND( (PERCENTILE_CONT(0.05) WITHIN GROUP (ORDER BY daily_return_pct))::numeric, 2) as var_95_historical_pct,

    MIN(daily_return_pct) as worst_day_pct

FROM market_returns
WHERE daily_return_pct IS NOT NULL
GROUP BY ticker;

SELECT * FROM market_returns;