SELECT MTH
	,PRO_STATE count(DISTINCT USER_ID) AS PRO_COUNT
FROM (
	SELECT (
			extract month FROM BDATE_FINAL
			) AS MTH
		,CASE 
			WHEN extract MONTH(DATEADD(mm, - 1, GETDATE())) <= MONTH(NOW())
				OR (
					extract month FROM BDATE_FINAL
					) = MONTH(NOW())
				THEN ‘REPEAT’
			WHEN (
					extract month FROM BDATE_FINAL
					) = MONTH(NOW())
				OR extract(month FROM BDATE_FINAL) <> MONTH(NOW())
				THEN ‘REACTIVE’
			ELSE ‘NEW’
			END
	) AS PRO_STATE
FROM sql_test
GROUP BY 1) as t
GROUP BY 1
	,2
ORDER BY 1
