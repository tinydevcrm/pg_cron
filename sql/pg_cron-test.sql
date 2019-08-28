CREATE EXTENSION pg_cron VERSION '1.0';
SELECT extversion FROM pg_extension WHERE extname='pg_cron';
ALTER EXTENSION pg_cron UPDATE TO '1.3';
SELECT extversion FROM pg_extension WHERE extname='pg_cron';

-- Vacuum every day at 10:00am (GMT)
SELECT cron.schedule('0 10 * * *', 'VACUUM');

-- Stop scheduling a job
SELECT cron.unschedule(1);

-- Vacuum every day at 10:00am (GMT)
SELECT cron.schedule('vacuum', '0 10 * * *', 'VACUUM');

-- Stop scheduling a job
SELECT cron.unschedule('vacuum');

DROP EXTENSION pg_cron;
