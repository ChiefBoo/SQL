select address, round(round(max(age), 2)-(round(min(age), 2) / round(max(age), 2)),2) as formula,
       round(avg(age),2) as average,
       round(round(max(age), 2)-(round(min(age), 2) / round(max(age), 2)),2) > avg(age) as comparison from person
group by address
order by address;