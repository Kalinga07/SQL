
# step 1- join in the same table, so we will have starting time and ending time in the same line

select a1.machine_id, a1.timestamp, a2.timestamp
from Activity a1
join Activity a2
on a1.process_id=a2.process_id
and a1.machine_id=a2.machine_id
and a1.timestamp<a2.timestamp;

#step 2: calculate the difference between timestamps, group the values by machine_id and 
# round average value of differences...

select a1.machine_id, round(avg(a2.timestamp-a1.timestamp),3) as processing_time
from Activity a1
join Activity a2
on a1.process_id=a2.process_id
and a1.machine_id=a2.machine_id
and a1.timestamp<a2.timestamp
group by a1.machine_id;
