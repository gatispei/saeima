

-- change party from " " to "" for some independent members
update members set party = "" where party = " ";


-- create index on votes, index by member_id
CREATE INDEX votes_idx_member ON votes(member_id);


-- change schema for polls table, change type of date column to time
CREATE TABLE polls_new (
       id integer PRIMARY KEY,
       date datetime,
       url text,
       motif text,
       registered integer,
       nebalso integer,
       par integer,
       pret integer,
       atturas integer
);
INSERT INTO polls_new SELECT * from polls;
DROP TABLE polls;
ALTER TABLE polls_new RENAME TO polls;
CREATE INDEX polls_idx_date ON polls(date);

--create table days with unique dates
CREATE TABLE days (
       date date
);
INSERT INTO days select distinct(date(date)) from polls;
CREATE TABLE days_new (
       id integer PRIMARY KEY,
       date date
);
INSERT INTO days_new SELECT rowid,date FROM days;
DROP TABLE days;
ALTER TABLE days_new RENAME TO days;


-- update votes member_id for andris berzins zzs
update votes set member_id = (select id from members where name = "Andris" and party = "ZZS") where member_id = (select id from members where name = "Andris ZZS" and party = "ZZS");
delete from members where name = "Andris ZZS" and party = "ZZS";

-- update votes member_id for andris berzins lpp/lc
update votes set member_id = (select id from members where name = "Andris" and party = "LPP/LC") where member_id = (select id from members where name = "Andris LPP/LC" and party = "LPP/LC");
delete from members where name = "Andris LPP/LC" and party = "LPP/LC";

-- update votes member_id for aigars stokenbergs
update votes set member_id = (select id from members where name = "Aigars" and party = "") where member_id = (select id from members where name = "Aigars" and party = "" LIMIT 1 OFFSET 1);
--delete from members where id = 150;

-- update votes member_id for artis pabriks
update votes set member_id = (select id from members where name = "Artis" and surname = "Pabriks" and party = "") where member_id = (select id from members where name = "Artis" and surname = "Pabriks" and party = "" LIMIT 1 OFFSET 1);

-- update votes member_id for visvaldis lacis
update votes set member_id = (select id from members where name = "Visvaldis" and party = "") where member_id = (select id from members where name = "Visvaldis" and party = "" LIMIT 1 OFFSET 1);

-- compute attendance rate
ALTER TABLE members ADD days integer;
ALTER TABLE members ADD votes integer;

@members = Member.find(:all)
@members.each { |m| m.days =  Member.count_by_sql("select count(distinct(date(date))) from polls inner join votes on polls.id = votes.poll_id where votes.member_id = #{m.id};"); m.save }


