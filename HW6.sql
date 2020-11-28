#2
select
	(select concat(firstname, ' ', lastname) from users where id = m.from_user_id) from_user,
	count(*) as total_msg 
from messages m
where 
	from_user_id in (select initiator_user_id from friend_requests where target_user_id = m.to_user_id and status = 'approved'
		union
	select target_user_id from friend_requests where initiator_user_id = m.to_user_id and status = 'approved') 
and
	to_user_id = 30 
group by m.from_user_id order by total_msg desc
limit 1;

#3
select SUM(total_likes)
from
	(select 
		users.id,
		TIMESTAMPDIFF(year, users.birthday, now()) as age,
		COUNT(posts.id) as total_posts,
		SUM(likes_posts.likepage) as total_likes
	from users
		left join posts
		on users.id = posts.user_id
		left join likes_posts
		on posts.id = likes_posts.post_id
	group by users.id
	order by age asc
	limit 10) `created`;

#4
select 
	users.gender,
	SUM(likes_posts.likepage) as total_likes
from users
	left join posts
	on users.id = posts.user_id
	left join likes_posts
	on posts.id = likes_posts.post_id
group by users.gender;

#5
select
	users.id,
	users.firstname,
	users.lastname,
	count(messages.message) as messages_written
from users
	left join messages
	on users.id = messages.from_user_id
group by users.id
limit 10;

	