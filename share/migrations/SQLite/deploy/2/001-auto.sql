-- 
-- Created by SQL::Translator::Producer::SQLite
-- Created on Wed Dec  3 15:21:27 2014
-- 

;
BEGIN TRANSACTION;
--
-- Table: hosts
--
CREATE TABLE hosts (
  host_id INTEGER PRIMARY KEY NOT NULL,
  name varchar(32) NOT NULL,
  timezone varchar(64) NOT NULL
);
--
-- Table: flamegraphs
--
CREATE TABLE flamegraphs (
  flamegraph_id INTEGER PRIMARY KEY NOT NULL,
  creation datetime NOT NULL,
  begin datetime NOT NULL,
  end datetime NOT NULL,
  host_fk int NOT NULL,
  stacks blob NOT NULL,
  svg blob,
  desc varchar(80),
  FOREIGN KEY (host_fk) REFERENCES hosts(host_id)
);
CREATE INDEX flamegraphs_idx_host_fk ON flamegraphs (host_fk);
COMMIT;
