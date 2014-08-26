CREATE TABLE users (
  user_id int not null auto_increment primary key,
  family_name varchar(10),
  first_name varchar(10),
  sex tinyint,
  mail varchar(100),
  photo varchar(255),
  created_at datetime,
  modified_at datetime
);

CREATE TABLE friends (
  user_id int,
  friend_id int
);

CREATE TABLE approaches (
  approach_id int not null auto_increment primary key,
  user_id int,
  target_id int,
  approached_at datetime
);

CREATE TABLE questions (
  question_id int not null quto_increment primary key,
  body text
);

CREATE TABLE conversations (
  conversation_id int not null auto_increment primary key,
  approach_id int,
  question_id int,
  question_at datetime,
  answer varchar(20),
  answer_at datetime
);


