create or replace function fnc_trg_person_delete_audit()
    returns trigger as
$person_audit$
    begin
        if tg_op = 'DELETE' then
            insert into person_audit
            select now()::timestamp, 'D', old.*;
        end if;
        return null;
    end;
$person_audit$ language plpgsql;

create or replace trigger  trg_person_delete_audit
    after delete on person
    for each row
    execute procedure fnc_trg_person_delete_audit();

delete from person where id = 10;