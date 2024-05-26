![image](https://github.com/rezzstra/Analysis-Of-The-Pizza-Chain/assets/142921009/1862ba45-4666-4832-aad8-848107105789)# Analysis-Of-The-Pizza-Chain

![image](https://github.com/rezzstra/Analysis-Of-The-Pizza-Chain/assets/142921009/fa783a6d-b2e0-4dd2-8526-0ccad7d3d068)

#### В рамках данного отчета был проведен анализ сети пиццерий с целью выявления ключевых факторов, влияющих на успешность бизнеса. Исследование охватывало анализ данных о продажах, популярности отдельных видов пицц, эффективности маркетинговых кампаний.  

## Вопросы: 
* Сколько всего продукта было проданно?
* Какого общее число заказов?
* Какова средняя стоимость заказа ($) ?
* Какова общая стоимость заказов ($) ?
* Какого среднее количество пицц за заказ?
* Есть ли разница между заказами в зависимости от дней недели?
* Существуют ли различия в количестве заказов по часам?
* Какие виды продукта продаются лучше, а какие хуже?

## SQL: 

```SQL

USE sales;

-- Изменил типы данных там, где это необходимо для дальнейшей обработки.

SELECT * FROM pizza;

ALTER TABLE pizza
ALTER COLUMN total_price FLOAT
ALTER TABLE pizza
ALTER COLUMN quantity INT;

```



### 1.  Сколько всего продукта было проданно?

```SQL
SELECT
	SUM(quantity) AS 'Количество проданной пиццы'
FROM 
	pizza;
```

**Результат**:

![image](https://github.com/rezzstra/Analysis-Of-The-Pizza-Chain/assets/142921009/d98f0f58-5152-4649-b89c-232bdbff266c)

  
### 2. Какого общее число заказов?

```SQL
SELECT
	COUNT(DISTINCT order_id) AS 'Общее число заказов'
FROM
	pizza;
```

**Результат**:

![image](https://github.com/rezzstra/Analysis-Of-The-Pizza-Chain/assets/142921009/95bd28d6-573e-43db-a1b2-acf73928d883)

### 3.  Какова средняя стоимость заказа ($) ?

```SQL
SELECT 
	SUM(total_price) / COUNT(DISTINCT order_id) AS 'Cредняя стоимость заказа'
FROM
	pizza;
```

**Результат**:

![image](https://github.com/rezzstra/Analysis-Of-The-Pizza-Chain/assets/142921009/0e1d3dbb-c14d-40f8-8eb6-ed269b5c6e37)

### 4.  Какова общая стоимость заказов? ($) ?

```SQL
SELECT 
	SUM(total_price) AS 'Общая стоимость заказов' 
FROM 
	pizza;
```

**Результат**:

![image](https://github.com/rezzstra/Analysis-Of-The-Pizza-Chain/assets/142921009/f43781a4-2d8f-400f-aa90-c5db3d80e8fb)

### 5. Какого среднее количество пицц за заказ?

```SQL
SELECT 
	SUM(quantity) / COUNT(DISTINCT order_id) AS 'Среднее количество пиц за заказ'
FROM pizza;
```

**Результат**:

![image](https://github.com/rezzstra/Analysis-Of-The-Pizza-Chain/assets/142921009/a394f508-ab2a-4768-b93b-5fbd13526f36)

### 6.Есть ли разница между заказами в зависимости от дней недели?

```SQL
SELECT
	DATENAME(weekday, order_date) AS 'День заказа',
	COUNT(DISTINCT order_id) AS 'Количество заказов'
FROM 
	pizza
GROUP BY
	DATENAME(weekday, order_date)
ORDER BY 'Количество заказов' DESC;
```

**Результат**:

![image](https://github.com/rezzstra/Analysis-Of-The-Pizza-Chain/assets/142921009/16db39d0-deb3-461b-a41b-dc1dd205dd12)

### 7. Существуют ли различия в количестве заказов по часам?

```SQL
SELECT
	DATEPART(HOUR, order_time) AS 'Время заказа', 
	COUNT(DISTINCT order_id) AS 'Количество заказов'
FROM 
	pizza
GROUP BY
	DATEPART(HOUR, order_time)
ORDER BY
	'Количество заказов' DESC
```

**Результат**:

![image](https://github.com/rezzstra/Analysis-Of-The-Pizza-Chain/assets/142921009/ebcab8db-dbc3-4820-9cec-24b7bface56c)






