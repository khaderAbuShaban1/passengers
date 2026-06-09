-- Storage buckets required by the apps and Edge Functions.
-- Keep sensitive uploads private. Public buckets are limited to user avatars and
-- generated call-center voice assets that are served directly by URL.

INSERT INTO storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
VALUES
  (
    'driver-documents',
    'driver-documents',
    false,
    10485760,
    ARRAY['image/jpeg', 'image/png', 'image/webp', 'application/pdf']
  ),
  (
    'payment-receipts',
    'payment-receipts',
    false,
    10485760,
    ARRAY['image/jpeg', 'image/png', 'image/webp', 'application/pdf']
  ),
  (
    'avatars',
    'avatars',
    true,
    5242880,
    ARRAY['image/jpeg', 'image/png', 'image/webp']
  ),
  (
    'ai-voice',
    'ai-voice',
    true,
    10485760,
    ARRAY['audio/mpeg', 'audio/mp3', 'audio/wav']
  )
ON CONFLICT (id) DO UPDATE
SET
  public = EXCLUDED.public,
  file_size_limit = EXCLUDED.file_size_limit,
  allowed_mime_types = EXCLUDED.allowed_mime_types;

DROP POLICY IF EXISTS "avatars_public_read" ON storage.objects;
CREATE POLICY "avatars_public_read"
ON storage.objects FOR SELECT
USING (bucket_id = 'avatars');

DROP POLICY IF EXISTS "avatars_owner_write" ON storage.objects;
CREATE POLICY "avatars_owner_write"
ON storage.objects FOR INSERT
WITH CHECK (
  bucket_id = 'avatars'
  AND auth.role() = 'authenticated'
  AND name LIKE auth.uid()::text || '/%'
);

DROP POLICY IF EXISTS "avatars_owner_update" ON storage.objects;
CREATE POLICY "avatars_owner_update"
ON storage.objects FOR UPDATE
USING (
  bucket_id = 'avatars'
  AND auth.role() = 'authenticated'
  AND name LIKE auth.uid()::text || '/%'
)
WITH CHECK (
  bucket_id = 'avatars'
  AND auth.role() = 'authenticated'
  AND name LIKE auth.uid()::text || '/%'
);

DROP POLICY IF EXISTS "driver_documents_owner_upload" ON storage.objects;
CREATE POLICY "driver_documents_owner_upload"
ON storage.objects FOR INSERT
WITH CHECK (
  bucket_id = 'driver-documents'
  AND auth.role() = 'authenticated'
  AND name LIKE 'documents/' || auth.uid()::text || '_%'
);

DROP POLICY IF EXISTS "driver_documents_owner_read" ON storage.objects;
CREATE POLICY "driver_documents_owner_read"
ON storage.objects FOR SELECT
USING (
  bucket_id = 'driver-documents'
  AND auth.role() = 'authenticated'
  AND (
    name LIKE 'documents/' || auth.uid()::text || '_%'
    OR EXISTS (
      SELECT 1
      FROM public.profiles p
      WHERE p.id = auth.uid()
        AND p.role = 'admin'
    )
  )
);

DROP POLICY IF EXISTS "payment_receipts_owner_upload" ON storage.objects;
CREATE POLICY "payment_receipts_owner_upload"
ON storage.objects FOR INSERT
WITH CHECK (
  bucket_id = 'payment-receipts'
  AND auth.role() = 'authenticated'
  AND name LIKE 'receipts/' || auth.uid()::text || '_%'
);

DROP POLICY IF EXISTS "payment_receipts_owner_read" ON storage.objects;
CREATE POLICY "payment_receipts_owner_read"
ON storage.objects FOR SELECT
USING (
  bucket_id = 'payment-receipts'
  AND auth.role() = 'authenticated'
  AND (
    name LIKE 'receipts/' || auth.uid()::text || '_%'
    OR EXISTS (
      SELECT 1
      FROM public.profiles p
      WHERE p.id = auth.uid()
        AND p.role = 'admin'
    )
  )
);

DROP POLICY IF EXISTS "ai_voice_public_read" ON storage.objects;
CREATE POLICY "ai_voice_public_read"
ON storage.objects FOR SELECT
USING (bucket_id = 'ai-voice');
