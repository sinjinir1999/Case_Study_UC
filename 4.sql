SELECT extract(month FROM BDATE_FINAL) AS MTH
	,count(DISTINCT RESPONDED_PRO_BOOKING) AS NEW_PRO
	,count(DISTINCT CASE 
			WHEN extract(month FROM BDATE_FINAL) <> MONTH(NOW())
				AND extract(year FROM BDATE_FINAL) = YEAR(NOW())
				THEN RESPONDED_PRO_BOOKING
			END) AS REPEAT_PRO
FROM SQL_TEST
GROUP BY 1
ORDER BY 1

