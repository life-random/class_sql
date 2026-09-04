select * from tb_person;
select * from tb_passport;

select p.name, pp.passport_number
from tb_person p
inner join tb_passport pp
on p.person_id = pp.person_id;


-- 잘못된 join
select p.name, pp.passport_number
from tb_person p
inner join tb_passport pp
on p.name = pp.person_id;