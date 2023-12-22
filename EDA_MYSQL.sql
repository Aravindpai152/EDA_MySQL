-- No of unique values in each of the columns
SELECT
  COUNT(DISTINCT area_type) AS unique_area_types,
  COUNT(DISTINCT availability) AS unique_availabilities,
  COUNT(DISTINCT location) AS unique_locations,
  COUNT(DISTINCT size) AS unique_sizes,
  COUNT(DISTINCT society) AS unique_societies,
  COUNT(DISTINCT total_sqft) AS unique_total_sqft,
  COUNT(DISTINCT bath) AS unique_baths,
  COUNT(DISTINCT balcony) AS unique_balconies,
  COUNT(DISTINCT price) AS unique_prices
FROM bengaluru_house_data;

-- Distinct area types available in the dataset
select distinct area_type  as distinct_area_type from bengaluru_house_data;

-- To check for missing values in the data set
SELECT
  SUM(CASE WHEN area_type IS NULL THEN 1 ELSE 0 END) AS missing_area_type,
  SUM(CASE WHEN availability IS NULL THEN 1 ELSE 0 END) AS missing_availability,
  SUM(CASE WHEN location IS NULL THEN 1 ELSE 0 END) AS missing_location,
  SUM(CASE WHEN size IS NULL THEN 1 ELSE 0 END) AS missing_size,
  SUM(CASE WHEN society IS NULL THEN 1 ELSE 0 END) AS missing_society,
  SUM(CASE WHEN total_sqft IS NULL THEN 1 ELSE 0 END) AS missing_total_sqft,
  SUM(CASE WHEN bath IS NULL THEN 1 ELSE 0 END) AS missing_bath,
  SUM(CASE WHEN balcony IS NULL THEN 1 ELSE 0 END) AS missing_balcony,
  SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS missing_price
FROM bengaluru_house_data;

-- What is the distribution of area_type column
SELECT area_type, COUNT(*) AS count
FROM bengaluru_house_data
GROUP BY area_type;

-- How many are marked as read to move in availability column
select count(*) as ready_to_move from bengaluru_house_data where availability = "Ready to move";

-- Location having highest no of properties listed
with cte as (select location, count(1) as properties_count, rank() over(order by count(1) desc) as rn from bengaluru_house_data group by location)
select * from cte where rn = 1;

-- Top 5 locations with highest average property prices
with cte as (select location, avg(price) as averge_price, dense_rank() over(order by avg(price) desc) as rn  from bengaluru_house_data group by location)
select * from cte where rn <=5;

-- Differnt values in the size columns
select distinct size from bengaluru_house_data;

-- The average price per square feet in each of the category
select size, avg(price) as avg_price from bengaluru_house_data group by size;

-- No of unique societies in the dataset
select count(distinct society) as no_of_distinct_society from bengaluru_house_data
where society is not null;