create table public.workspaces (
  id uuid primary key default gen_random_uuid(),
  name text not null default 'Yeni İşletme',
  created_at timestamptz not null default now()
);

create table public.workspace_members (
  workspace_id uuid references public.workspaces(id) on delete cascade,
  user_id uuid references auth.users(id) on delete cascade,
  role text not null default 'owner' check (role in ('owner','member')),
  primary key (workspace_id, user_id)
);

create table public.transactions (
  id uuid primary key default gen_random_uuid(), workspace_id uuid not null references public.workspaces(id) on delete cascade,
  type text not null check (type in ('income','expense')), date date not null, description text not null,
  category text not null, amount_minor bigint not null check (amount_minor > 0), customer_id uuid, created_at timestamptz not null default now()
);

create table public.customers (
  id uuid primary key default gen_random_uuid(), workspace_id uuid not null references public.workspaces(id) on delete cascade,
  name text not null, phone text default '', email text default '', created_at timestamptz not null default now()
);

create table public.receivables (
  id uuid primary key default gen_random_uuid(), workspace_id uuid not null references public.workspaces(id) on delete cascade,
  customer_id uuid references public.customers(id) on delete set null, description text not null, due_date date not null,
  amount_minor bigint not null check (amount_minor > 0), status text not null default 'pending' check (status in ('pending','paid')), created_at timestamptz not null default now()
);

alter table public.workspaces enable row level security;
alter table public.workspace_members enable row level security;
alter table public.transactions enable row level security;
alter table public.customers enable row level security;
alter table public.receivables enable row level security;

create or replace function public.is_workspace_member(target uuid)
returns boolean language sql security definer set search_path = public
as $$ select exists(select 1 from public.workspace_members where workspace_id=target and user_id=auth.uid()); $$;

create policy "members can read workspaces" on public.workspaces for select using (public.is_workspace_member(id));
create policy "users can read memberships" on public.workspace_members for select using (user_id = auth.uid());
create policy "users can create memberships" on public.workspace_members for insert with check (user_id = auth.uid());
create policy "authenticated users can create workspaces" on public.workspaces for insert with check (auth.uid() is not null);
create policy "members can manage transactions" on public.transactions for all using (public.is_workspace_member(workspace_id)) with check (public.is_workspace_member(workspace_id));
create policy "members can manage customers" on public.customers for all using (public.is_workspace_member(workspace_id)) with check (public.is_workspace_member(workspace_id));
create policy "members can manage receivables" on public.receivables for all using (public.is_workspace_member(workspace_id)) with check (public.is_workspace_member(workspace_id));

create or replace function public.create_workspace(workspace_name text)
returns uuid
language plpgsql
security definer
set search_path = public
as $$
declare new_workspace_id uuid;
begin
  if auth.uid() is null then raise exception 'Not authenticated'; end if;
  insert into public.workspaces(name) values (coalesce(nullif(trim(workspace_name),''),'Yeni İşletme')) returning id into new_workspace_id;
  insert into public.workspace_members(workspace_id,user_id,role) values (new_workspace_id,auth.uid(),'owner');
  return new_workspace_id;
end;
$$;

revoke all on function public.create_workspace(text) from public;
grant execute on function public.create_workspace(text) to authenticated;
