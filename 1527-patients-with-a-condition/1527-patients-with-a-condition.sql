# Write your MySQL query statement below
Select 
    patient_id
    ,patient_name
    ,conditions
From Patients 
    WHERE conditions like 'DIAB1%' or conditions like '% DIAB1%' 