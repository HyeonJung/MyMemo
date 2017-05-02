CREATE TABLE MEMO(
	MemoNo int auto_increment,
    content varchar(5000) not null,
    regdate datetime not null,
    deldate datetime null,
    notidate datetime null,
    moddate datetime null,
    importance boolean null,
    email varchar(50) not null,
    primary key(MemoNo),
    foreign key(email) references Member(email)
    );