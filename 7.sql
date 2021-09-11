
SELECT MTH
	,ACTIVE_PRO
	,CHURN_PRO
	,(round(((CHURN_PRO * 100.0) / NULLIF(ACTIVE_PRO, 0.00)), 2) || '%') AS CHURN_PERCENTAGE
FROM (
	SELECT extract(month FROM BDATE_FINAL) AS MTH
		,COUNT(DISTINCT CASE 
				WHEN RESPONDED_PRO_BOOKING IS NOT NULL
					THEN USER_ID
				END) AS ACTIVE_PRO
		,COUNT(DISTINCT CASE 
				WHEN RESPONDED_PRO_BOOKING IS NULL
					THEN USER_ID
				END) AS CHURN_PRO
	FROM SQL_TEST
	GROUP BY 1
	ORDER BY 1
	) AS t
