CREATE TABLE public.members(
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  title text NOT NULL,
  first_name text NOT NULL,
  last_name text NOT NULL,
  status text NOT NULL,
  slug text,
  created_at timestamp DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp,
  CONSTRAINT member_pkey PRIMARY KEY(id)
);

  CREATE UNIQUE INDEX members_slug_idx ON public.members(slug);
