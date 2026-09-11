create table "sousaku-notebook" (
  id text primary key default 'notebook',
  salt text not null,
  iv text not null,
  ciphertext text not null,
  updated_at timestamptz default now()
);
alter table "sousaku-notebook" enable row level security;
create policy "anon full access" on "sousaku-notebook" for all using (true) with check (true);

create table "sousaku-notebook-images" (
  image_id text primary key,
  iv text not null,
  mime text not null,
  cipher_b64 text not null,
  updated_at timestamptz default now()
);
alter table "sousaku-notebook-images" enable row level security;
create policy "anon full access" on "sousaku-notebook-images" for all using (true) with check (true);
