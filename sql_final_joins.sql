INSERT INTO users ( user_id, user_name, department_id ) VALUES ( 1, 'Modesto', 1);
INSERT INTO users ( user_id, user_name, department_id ) VALUES ( 2, 'Ayine', 1);
INSERT INTO users ( user_id, user_name, department_id ) VALUES ( 3, 'Christopher', 2);
INSERT INTO users ( user_id, user_name, department_id ) VALUES ( 4, 'Cheong Woo', 2);
INSERT INTO users ( user_id, user_name, department_id ) VALUES ( 5, 'saulat', 3);
INSERT INTO users ( user_id, user_name, department_id ) VALUES ( 6, 'Heidy', NULL);

select * from users

ALTER TABLE `users` CHANGE COLUMN `room_id` `department_id` int NULL;
 
ALTER TABLE `departments` CHANGE COLUMN `parent_id` `room_id` int NULL;

ALTER TABLE `rooms` CHANGE COLUMN `parent_id` `department_id` int NULL;

select * from departments

select * from users

ALTER TABLE departments DROP COLUMN room_id;

INSERT INTO departments ( department_id, department_name) VALUES ( 1, 'IT');
INSERT INTO departments ( department_id, department_name) VALUES ( 2, 'Sales');
INSERT INTO departments ( department_id, department_name) VALUES ( 3, 'Administration');
INSERT INTO departments ( department_id, department_name) VALUES ( 4, 'Operations');

CREATE TABLE deptusers (
  deptusers_id int PRIMARY KEY,
  department_id int NOT NULL,
  user_id int NULL
);
INSERT INTO deptusers ( deptusers_id, department_id, user_id) VALUES ( 1, '1', '1');
INSERT INTO deptusers ( deptusers_id, department_id, user_id) VALUES ( 2, '1', '2');
INSERT INTO deptusers ( deptusers_id, department_id, user_id) VALUES ( 3, '2', '3');
INSERT INTO deptusers ( deptusers_id, department_id, user_id) VALUES ( 4, '2', '4');
INSERT INTO deptusers ( deptusers_id, department_id, user_id) VALUES ( 5, '3', '5');
INSERT INTO deptusers ( deptusers_id, department_id, user_id) VALUES ( 6, '4', null);

SELECT * FROM departments

ALTER TABLE rooms DROP COLUMN department_id;

INSERT INTO rooms ( room_id, room_name) VALUES ( 1, '101');
INSERT INTO rooms ( room_id, room_name) VALUES ( 2, '102');
INSERT INTO rooms ( room_id, room_name) VALUES ( 3, 'Auditorium A');
INSERT INTO rooms ( room_id, room_name) VALUES ( 4, 'Auditorium B');

SELECT * FROM rooms


CREATE TABLE deptrooms (
  deptrooms_id int PRIMARY KEY,
  department_id int NOT NULL,
  room_id int NULL
);

INSERT INTO deptrooms ( deptrooms_id, department_id, room_id) VALUES ( 1, '1', '1');
INSERT INTO deptrooms ( deptrooms_id, department_id, room_id) VALUES ( 2, '1', '2');
INSERT INTO deptrooms ( deptrooms_id, department_id, room_id) VALUES ( 3, '2', '2');
INSERT INTO deptrooms ( deptrooms_id, department_id, room_id) VALUES ( 4, '2', '3');


#1. All groups and the users in each group

SELECT * FROM deptusers
INNER JOIN departments
ON deptusers.department_id = departments.department_id

#2. All rooms and the groups assigned to each room

SELECT
deptrooms.deptrooms_id,
deptrooms.department_id,
departments.department_name,
deptrooms.room_id
FROM deptrooms
LEFT JOIN departments
ON deptrooms.department_id = departments.department_id


#3. A list of users, the groups that they belong to, and the rooms to which they are assigned. This should be sorted
#alphabetically by user, then by group, then by room.
SELECT
users.user_id,
users.user_name,
users.department_id,
deptrooms.room_id
FROM users
LEFT JOIN deptrooms
ON users.department_id = deptrooms.department_id
ORDER BY users.user_id, department_id, deptrooms.department_id




