# Summarize Common Themes and Recurring Reasons
SELECT Reason, SUM(Count) AS Total_Count
FROM (
SELECT  Reason_Equity As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_Equity LIKE '%Capital%'
GROUP BY Reason
UNION ALL
SELECT Reason_Mutual As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_Mutual LIKE '%Capital%'
GROUP BY Reason 
UNION ALL
SELECT Reason_Bonds As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_Bonds LIKE '%Capital%'
GROUP BY Reason
UNION ALL
SELECT Reason_FD As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_FD LIKE '%Capital%'
GROUP BY Reason
UNION ALL		

SELECT Reason_Equity As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_Equity LIKE '%Dividend%'
GROUP BY Reason_Equity
UNION ALL
SELECT Reason_Mutual As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_Mutual LIKE '%Dividend%'
GROUP BY Reason_Mutual
UNION ALL
SELECT Reason_Bonds As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_Bonds LIKE '%Dividend%'
GROUP BY Reason_Bonds
UNION ALL
SELECT Reason_FD As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_FD LIKE '%Dividend%'
GROUP BY Reason_FD
UNION ALL

SELECT Reason_Equity As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_Equity LIKE '%Interest%'
GROUP BY Reason_Equity
UNION ALL
SELECT Reason_Mutual As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_Mutual LIKE '%Interest%'
GROUP BY Reason_Mutual
UNION ALL
SELECT Reason_Bonds As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_Bonds LIKE '%Interest%'
GROUP BY Reason_Bonds
UNION ALL
SELECT Reason_FD As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_FD LIKE '%Interest%'
GROUP BY Reason_FD
UNION ALL

SELECT 'Tax BEnifit And Tax Incentives', SUM(Count) AS Count
FROM(
SELECT Reason_Equity As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_Equity LIKE '%Tax%'
GROUP BY Reason_Equity
UNION ALL
SELECT Reason_Mutual As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_Mutual LIKE '%Tax%'
GROUP BY Reason_Mutual
UNION ALL
SELECT Reason_Bonds As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_Bonds LIKE '%Tax%' 
GROUP BY Reason_Bonds
UNION ALL
SELECT Reason_FD As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_FD LIKE '%Tax%'
GROUP BY Reason_FD) AS Combined_Tax_benifit
UNION ALL

SELECT 'Better Returns,Assured Returns And Fixed Returns' AS reason, SUM(Count) AS Count
FROM(
SELECT Reason_Equity As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_Equity LIKE '%Return%'
GROUP BY Reason_Equity
UNION ALL
SELECT Reason_Mutual As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_Mutual LIKE '%Return%'
GROUP BY Reason_Mutual
UNION ALL
SELECT Reason_Bonds As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_Bonds LIKE '%Return%' 
GROUP BY Reason_Bonds
UNION ALL
SELECT Reason_FD As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_FD LIKE '%Return%'
GROUP BY Reason_FD) AS Combined_Returnes
UNION ALL

SELECT 'Liquidity and Fund Diversification' AS Reason, SUM(Count) AS Count 
FROM (
SELECT Reason_Equity As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_Equity LIKE '%Liquidity%' OR Reason_Equity LIKE '%Diversification%'
GROUP BY Reason_Equity
UNION ALL
SELECT Reason_Mutual As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_Mutual LIKE '%Liquidity%' OR Reason_Mutual LIKE '%Diversification%'
GROUP BY Reason_Mutual
UNION ALL
SELECT Reason_Bonds As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_Bonds LIKE '%Liquidity%' OR Reason_Bonds LIKE '%Diversification%'
GROUP BY Reason_Bonds
UNION ALL
SELECT Reason_FD As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_FD LIKE '%Liquidity%' OR Reason_FD LIKE '%Diversification%'
GROUP BY Reason_FD) AS Combined_Liquidity
UNION ALL

SELECT 'Safe and Risk free' AS Reason, SUM(Count) AS Count
FROM (
SELECT Reason_Equity As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_Equity LIKE '%Safe%' OR Reason_Equity LIKE '%Risk Free%'
GROUP BY Reason_Equity
UNION ALL
SELECT Reason_Mutual As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_Mutual LIKE '%Safe%' OR Reason_Mutual LIKE '%Risk Free%'
GROUP BY Reason_Mutual
UNION ALL
SELECT Reason_Bonds As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_Bonds LIKE '%Safe%' OR Reason_Bonds LIKE '%Risk Free%'
GROUP BY Reason_Bonds
UNION ALL
SELECT Reason_FD As Reason, COUNT(*) AS Count
FROM investment
WHERE Reason_FD LIKE '%Safe%' OR Reason_FD LIKE '%Risk Free%'
GROUP BY Reason_FD) AS Combined_Safe_Investment
) AS Combined_Result
GROUP BY Reason
ORDER BY Total_Count DESC;
