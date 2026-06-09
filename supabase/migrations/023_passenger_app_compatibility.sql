-- Compatibility fixes required by the passenger app.

-- App issues do not always have a reported user. Keep reporter_id required,
-- but allow reported_user_id to be null for app/support complaints.
ALTER TABLE public.complaints
  ALTER COLUMN reported_user_id DROP NOT NULL;

ALTER TABLE public.complaints
  DROP CONSTRAINT IF EXISTS complaints_no_self_report;

ALTER TABLE public.complaints
  ADD CONSTRAINT complaints_no_self_report
  CHECK (reported_user_id IS NULL OR reporter_id != reported_user_id);
