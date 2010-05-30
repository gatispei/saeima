
CREATE TABLE polls (
       id integer PRIMARY KEY,
       date time,
       url text,
       motif text,
       registered integer,
       nebalso integer,
       par integer,
       pret integer,
       atturas integer
);
CREATE INDEX polls_idx_date ON polls(date);

CREATE TABLE members (
       id integer PRIMARY KEY,
       surname text,
       name text,
       party text
);

CREATE INDEX members_idx ON members(surname, name, party);

CREATE TABLE votes (
       id integer PRIMARY KEY,
       poll_id integer,
       member_id integer,
       vote integer
);





