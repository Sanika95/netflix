create database netflix;
use netflix;
select * from titles;

-- count total number of records
select count(*) as total_records
from titles;

-- unique value in each cloumns
select
count(distinct show_id) as unique_show_ids,
count(distinct type) as unique_types,
count(distinct title) as unique_titles,
count(distinct director) as unique_directors,
count(distinct cast) as unique_casts,
count(distinct country) as unique_countreis,
count(distinct dates_added) as unique_dates_added,
count(distinct release_year) as unique_release_years,
count(distinct rating) as unique_ratings,
count(distinct duration) as unique_durations,
count(distinct listed_in) as unique_listed_in,
count(distinct descriptions) as unique_descriptions
from titles;

--
select
sum(case when cast is null then 1 else 0 end) as missing_casts,
sum(case when country is null then 1 else 0 end) as missing_countrys,
sum(case when date_added  is null then 1 else 0 end) as missing_dates_added,
sum(case when rating is null then 1 else 0 end) as missing_ratings,
sum(case when duration is null then 1 else 0 end) as missing_durationss
from titles;

--
select type,count(*) as count
from titles
group by type
order by count desc;

--
select rating,count(*) as count
from titles
group by rating
order by count desc;

select release_year,count(*) as count
from titles
group by release_year
order by release_year;

-- top 10 most common director
select director,count(*) as count
from titles
group by director
order by count desc
limit 10;

select country,count(*) as count
from titles
group by country
order by count desc
limit 10;

select date_format(str_to_date(date_added,'%b %d, %Y'),'%Y-%m')as month,count(*)as count
from titles
group by month
order by month;

select count(*) as count
from titles
where listed_in like '%dramas%';

select avg(cast(substring_index(duration,' ',1)as unsigned)) as average_duration
from titles
where duration regexp'^[0-9]+ min$';

select count(*) as count
from titles
where director="";

select*
from titles
where release_year>=year(curdate())-5;

select type,title
from titles
where country='india';

select *
from titles
where duration like'%seasons';

select *
from titles
where duration like'%seasons%'
and cast(substring_index(substring_index(duration,' ',1),' ',-1) as unsigned)>2;

