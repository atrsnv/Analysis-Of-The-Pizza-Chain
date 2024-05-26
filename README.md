# Analysis-Of-The-Pizza-Chain

![image](https://github.com/rezzstra/Analysis-Of-The-Pizza-Chain/assets/142921009/fa783a6d-b2e0-4dd2-8526-0ccad7d3d068)

#### В рамках данного отчета был проведен анализ сети пиццерий с целью выявления ключевых факторов, влияющих на успешность бизнеса. Исследование охватывало анализ данных о продажах, популярности отдельных видов пицц, эффективности маркетинговых кампаний.  

## Вопросы: 
* Сколько всего продукта было проданно?
* Какого общее число заказов?
* Какова средняя стоимость заказа ($) ?
* Какова общая стоимость заказов?
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

![image](https://github.com/rezzstra/Analysis-Of-The-Pizza-Chain/assets/142921009/95bd28d6-573e-43db-a1b2-acf73928d883)




