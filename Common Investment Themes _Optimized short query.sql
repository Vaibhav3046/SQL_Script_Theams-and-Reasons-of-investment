WITH AllReasons AS (
    SELECT Reason_Equity AS Reason FROM investment WHERE Reason_Equity LIKE '%Capital%' OR Reason_Equity LIKE '%Dividend%' OR Reason_Equity LIKE '%Interest%' OR Reason_Equity LIKE '%Tax%' OR Reason_Equity LIKE '%Return%' OR Reason_Equity LIKE '%Liquidity%' OR Reason_Equity LIKE '%Diversification%' OR Reason_Equity LIKE '%Safe%' OR Reason_Equity LIKE '%Risk Free%'
    UNION ALL
    SELECT Reason_Mutual AS Reason FROM investment WHERE Reason_Mutual LIKE '%Capital%' OR Reason_Mutual LIKE '%Dividend%' OR Reason_Mutual LIKE '%Interest%' OR Reason_Mutual LIKE '%Tax%' OR Reason_Mutual LIKE '%Return%' OR Reason_Mutual LIKE '%Liquidity%' OR Reason_Mutual LIKE '%Diversification%' OR Reason_Mutual LIKE '%Safe%' OR Reason_Mutual LIKE '%Risk Free%'
    UNION ALL
    SELECT Reason_Bonds AS Reason FROM investment WHERE Reason_Bonds LIKE '%Capital%' OR Reason_Bonds LIKE '%Dividend%' OR Reason_Bonds LIKE '%Interest%' OR Reason_Bonds LIKE '%Tax%' OR Reason_Bonds LIKE '%Return%' OR Reason_Bonds LIKE '%Liquidity%' OR Reason_Bonds LIKE '%Diversification%' OR Reason_Bonds LIKE '%Safe%' OR Reason_Bonds LIKE '%Risk Free%'
    UNION ALL
    SELECT Reason_FD AS Reason FROM investment WHERE Reason_FD LIKE '%Capital%' OR Reason_FD LIKE '%Dividend%' OR Reason_FD LIKE '%Interest%' OR Reason_FD LIKE '%Tax%' OR Reason_FD LIKE '%Return%' OR Reason_FD LIKE '%Liquidity%' OR Reason_FD LIKE '%Diversification%' OR Reason_FD LIKE '%Safe%' OR Reason_FD LIKE '%Risk Free%'
),
ThemedReasons AS (
    SELECT 
        CASE 
            WHEN Reason LIKE '%Tax%' THEN 'Tax Benefit And Tax Incentives'
            WHEN Reason LIKE '%Return%' THEN 'Better Returns, Assured Returns And Fixed Returns'
            WHEN Reason LIKE '%Liquidity%' OR Reason LIKE '%Diversification%' THEN 'Liquidity and Fund Diversification'
            WHEN Reason LIKE '%Safe%' OR Reason LIKE '%Risk Free%' THEN 'Safe and Risk Free'
            ELSE Reason
        END AS Reason
    FROM AllReasons
)
SELECT Reason, COUNT(*) AS Count
FROM ThemedReasons
GROUP BY Reason
ORDER BY Count DESC;

