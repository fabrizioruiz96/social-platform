use db_milestone;

# 1. Seleziona gli utenti che hanno postato almeno un video
select distinct u.*, m.type
from users as u
join medias as m on u.id = m.user_id
where m.type = 'video';

# 2. Seleziona tutti i post senza Like (13)
select p.*
from posts as p
left join likes as l on p.id = l.post_id
where l.post_id is null;

# 3. Conta il numero di like per ogni post (152)
select p.*, count(l.post_id) as numero_like
from posts as p 
join likes as l on p.id = l.post_id
where l.post_id is not null
group by p.id;

# 4. Ordina gli utenti per il numero di media caricati (25) 
select u.*, count(m.id) as numero_media_caricati
from users as u
join medias as m on u.id = m.user_id
group by m.user_id
order by numero_media_caricati;

# 5. Ordina gli utenti per totale di likes ricevuti nei loro posts (25) 
select u.*, count(l.post_id) as numero_likes
from users as u
join posts as p on u.id = p.user_id
join likes as l on p.id = l.post_id
group by u.id
order by numero_likes;