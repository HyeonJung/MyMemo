CREATE TABLE MEMBER(
	email VARCHAR(50) NOT NULL,
    name VARCHAR(20) NOT NULL,
    pass VARCHAR(30) NOT NULL,
    regDate datetime not null,
    primary key(email)
 );