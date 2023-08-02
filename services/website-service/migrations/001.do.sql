
CREATE TABLE public.categories(
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  "name" text NOT NULL,
  caption text,
  slug text NOT NULL,
  created_at timestamp DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp,
  CONSTRAINT categories_pkey PRIMARY KEY(id),
  CONSTRAINT unique_name UNIQUE("name")
);

  CREATE UNIQUE INDEX categories_slug_idx ON public.categories(slug);
  
CREATE TABLE public.course_categories(
  course_id uuid NOT NULL DEFAULT gen_random_uuid(),
  category_id uuid NOT NULL,
  caption text,
  description text,
  badge text,
  url_path text,
  created_at timestamp DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp,
  CONSTRAINT course_categories_pkey PRIMARY KEY(course_id, category_id)
);

CREATE TABLE public.course_items(
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  title text NOT NULL,
  description text NOT NULL,
  unit_price integer NOT NULL,
  status text NOT NULL,
  slug text NOT NULL,
  created_at timestamp DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp,
  course_id uuid NOT NULL,
  CONSTRAINT course_items_pkey PRIMARY KEY(id)
);

  CREATE UNIQUE INDEX course_items_slug_idx ON public.course_items(slug);
  
CREATE TABLE public.courses(
  id uuid NOT NULL DEFAULT gen_random_uuid(),
  title text NOT NULL,
  description text NOT NULL,
  status text NOT NULL,
  slug text NOT NULL,
  created_at timestamp DEFAULT CURRENT_TIMESTAMP,
  updated_at timestamp,
  CONSTRAINT course_pkey PRIMARY KEY(id)
);

  CREATE UNIQUE INDEX courses_slug_idx ON public.courses(slug);
  
ALTER TABLE public.course_items
  ADD CONSTRAINT course_items_course_id_fkey
    FOREIGN KEY (course_id) REFERENCES public.courses (id) ON DELETE Cascade
      ON UPDATE Cascade;

ALTER TABLE public.course_categories
  ADD CONSTRAINT course_categories_course_id_fkey
    FOREIGN KEY (course_id) REFERENCES public.courses (id) ON DELETE Cascade
      ON UPDATE Cascade;

ALTER TABLE public.course_categories
  ADD CONSTRAINT course_categories_category_id_fkey
    FOREIGN KEY (category_id) REFERENCES public.categories (id) ON DELETE Restrict
      ON UPDATE Cascade;
