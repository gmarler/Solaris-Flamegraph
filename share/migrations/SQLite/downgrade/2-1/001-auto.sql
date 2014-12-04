-- Convert schema '/home/gmarler/gitwork/Solaris-Flamegraph/share/migrations/_source/deploy/2/001-auto.yml' to '/home/gmarler/gitwork/Solaris-Flamegraph/share/migrations/_source/deploy/1/001-auto.yml':;

;
BEGIN;

;
CREATE TEMPORARY TABLE flamegraphs_temp_alter (
  flamegraph_id INTEGER PRIMARY KEY NOT NULL,
  creation datetime NOT NULL,
  begin datetime NOT NULL,
  end datetime NOT NULL,
  host_fk int NOT NULL,
  stacks blob NOT NULL,
  svg blob,
  FOREIGN KEY (host_fk) REFERENCES hosts(host_id)
);

;
INSERT INTO flamegraphs_temp_alter( flamegraph_id, creation, begin, end, host_fk, stacks, svg) SELECT flamegraph_id, creation, begin, end, host_fk, stacks, svg FROM flamegraphs;

;
DROP TABLE flamegraphs;

;
CREATE TABLE flamegraphs (
  flamegraph_id INTEGER PRIMARY KEY NOT NULL,
  creation datetime NOT NULL,
  begin datetime NOT NULL,
  end datetime NOT NULL,
  host_fk int NOT NULL,
  stacks blob NOT NULL,
  svg blob,
  FOREIGN KEY (host_fk) REFERENCES hosts(host_id)
);

;
CREATE INDEX flamegraphs_idx_host_fk02 ON flamegraphs (host_fk);

;
INSERT INTO flamegraphs SELECT flamegraph_id, creation, begin, end, host_fk, stacks, svg FROM flamegraphs_temp_alter;

;
DROP TABLE flamegraphs_temp_alter;

;

COMMIT;

