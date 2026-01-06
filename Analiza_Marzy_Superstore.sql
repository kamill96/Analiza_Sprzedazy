USE SuperstoreProjekt; 
GO

SELECT TOP 10
    [Category],
    [Sub_Category],
    SUM(CAST([Sales] AS float)) AS Suma_Sprzedazy,
    SUM(CAST([Profit] AS float)) AS Suma_Zysku,
    

    ROUND(
        SUM(CAST([Profit] AS float)) 
        
        NULLIF(SUM(CAST([Sales] AS float)), 0), 
    3) AS Marza_Procent

FROM
    raw_superstore
GROUP BY
    [Category],
    [Sub_Category]
ORDER BY
    Marza_Procent asc;



	SELECT COUNT(DISTINCT [Sub_Category]) AS Liczba_Podkategorii
FROM raw_superstore;



Select  top 5
	[Customer_Name],
	COUNT([Order_ID]) AS Liczba_Zamowien,
	SUM(Cast([Sales] AS float)) AS Laczne_Wydatki
from
	raw_superstore
group by
	[Customer_Name]
order by
	Laczne_Wydatki desc;



Select top 20
	[Product_name],
	SUM(Cast([sales] AS float)) as sprzedaz,
	SUM(Cast([Profit] AS float)) as Zysk
from
	raw_superstore
where 
	[Sub_Category] = 'Tables'
group by
	[Product_Name]
order by
	zysk asc;


select
	[Customer_Name],
	SUM(Cast([Sales] AS float)) AS Wartosc_Zakupow,

	case
		when sum(cast([Sales] AS float)) > 3000 then 'Klient VIP'
		when sum(cast([Sales] AS float)) > 1500 then 'Klient Dobry'
		else 'Klient Standard'
	end as Status_Klienta

from
	raw_superstore
group by
	[Customer_name]
order by
	Wartosc_Zakupow desc;




select
	[Customer_Name],
	SUM(Cast([Sales] AS float)) AS Wartosc_Zakupow,

	case
		when sum(cast([Sales] AS float)) > 3000 then 'Klient VIP'
		when sum(cast([Sales] AS float)) > 1500 then 'Klient Dobry'
		else 'Klient Standard'
	end as Status_Klienta

from
	raw_superstore
group by
	[Customer_name]
order by newid();



select top 100
	[Customer_Name],
	SUM(CAST([Sales] AS Float)) AS Wartosc_Zakupow,
	'Klient Standard' AS Status
from 
	raw_superstore
group by 
	[Customer_Name]
Having 
	SUM(Cast([Sales] AS float)) <= 1500
order by 
	Wartosc_Zakupow desc;