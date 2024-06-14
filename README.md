# SQL_Script_Theams-and-Reasons-of-investment
I am providing my SQL query here and i am uploading my SQL Script as well 
to find the common themes and reasons of investment in the dataset.
i am providing two queries here The 1st query is a long and the 2nd query is optimizes short query 
here is the dataset - https://drive.google.com/drive/folders/1srgjB4DMLK2LWl9NDIJdWBlWYQ3oHM80

#1. Summarize Common Themes and Recurring Reasons

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


#2. Summarize Common Themes and Recurring Reasons Optimizes Query

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


