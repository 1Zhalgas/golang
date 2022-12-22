ALTER TABLE movies ADD COLUMN new_id UUID NULL;
UPDATE movies SET new_id = CAST(LPAD(TO_HEX(version), 32, '0') AS UUID);
ALTER TABLE movies DROP COLUMN version;
ALTER TABLE movies RENAME COLUMN new_id TO version;
ALTER TABLE movies ALTER COLUMN version SET NOT NULL;