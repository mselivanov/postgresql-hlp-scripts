create table one_row(id uuid, one_row_check int not null check(one_row_check in (1)));
create unique index idx_one_row_one_row_check on one_row(one_row_check);
