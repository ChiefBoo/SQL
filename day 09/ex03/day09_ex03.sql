drop trigger if exists trg_person_insert_audit on person;
drop trigger if exists trg_person_update_audit on person;
drop trigger if exists trg_person_delete_audit on person;

drop function if exists fnc_trg_person_insert_audit;
drop function if exists fnc_trg_person_update_audit;
drop function if exists fnc_trg_person_delete_audit;

truncate person_audit;

create or replace function fnc_trg_person_audit()
    returns trigger as
$person_audit$
    begin
        if tg_op = 'INSERT' then
            insert into person_audit
            select now()::timestamp, 'I', new.*;
        elsif tg_op = 'UPDATE' then
            insert into person_audit
            select now()::timestamp, 'U', old.*;
        elsif tg_op = 'DELETE' then
            insert into person_audit
            select now()::timestamp, 'D', old.*;
        end if;
        return null;
    end;
$person_audit$ language plpgsql;

create or replace trigger trg_person_audit
    after insert or update or delete on person
    for each row
    execute procedure fnc_trg_person_audit();

insert into person(id, name, age, gender, address)
values (10, 'Damir', 22, 'male', 'Irkutsk');
update person set name = 'Bulat' where id = 10;
update person set name = 'Damir' where id = 10;
delete from person where id = 10;
