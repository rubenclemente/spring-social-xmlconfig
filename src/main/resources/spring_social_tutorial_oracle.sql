CREATE TABLE role
(
   id        NUMBER (20) NOT NULL,
   role      NUMBER (11) DEFAULT NULL,
   user_id   NUMBER (20) DEFAULT NULL
);

ALTER TABLE role ADD (
  CONSTRAINT PK_ROLE
 PRIMARY KEY
 (ID)
 );

CREATE SEQUENCE role_seq
   START WITH 1
   INCREMENT BY 1
   NOMAXVALUE;

CREATE TRIGGER role_trigger
   BEFORE INSERT
   ON role
   FOR EACH ROW
BEGIN
   SELECT role_seq.NEXTVAL INTO :new.id FROM DUAL;
END;

INSERT INTO role (id, role, user_id)
     VALUES (1, 1, 1);

INSERT INTO role (id, role, user_id)
     VALUES (2, 2, 2);

INSERT INTO role (id, role, user_id)
     VALUES (3, 1, 3);

INSERT INTO role (id, role, user_id)
     VALUES (4, 1, 4);

INSERT INTO role (id, role, user_id)
     VALUES (5, 2, 5);

INSERT INTO role (id, role, user_id)
     VALUES (6, 1, 6);

INSERT INTO role (id, role, user_id)
     VALUES (7, 2, 7);

INSERT INTO role (id, role, user_id)
     VALUES (8, 1, 8);

CREATE TABLE suser
(
   id          NUMBER (20) NOT NULL,
   firstName   VARCHAR (255) DEFAULT NULL,
   lastName    VARCHAR (255) DEFAULT NULL,
   password    VARCHAR (255) DEFAULT NULL,
   username    VARCHAR (255) DEFAULT NULL
);

ALTER TABLE suser ADD (
  CONSTRAINT PK_suser
 PRIMARY KEY
 (ID)
 );

CREATE SEQUENCE suser_seq
   START WITH 1
   INCREMENT BY 1
   NOMAXVALUE;

CREATE TRIGGER suser_trigger
   BEFORE INSERT
   ON suser
   FOR EACH ROW
BEGIN
   SELECT suser_seq.NEXTVAL INTO :new.id FROM DUAL;
END;

INSERT INTO suser (id,
                        firstName,
                        lastName,
                        password,
                        username)
     VALUES (1,
             'John',
             'Smith',
             '21232f297a57a5a743894a0e4a801fc3',
             'john');

INSERT INTO suser (id,
                        firstName,
                        lastName,
                        password,
                        username)
     VALUES (2,
             'Jane',
             'Adams',
             'ee11cbb19052e40b07aac0ca060c23ee',
             'jane');

INSERT INTO suser (id,
                        firstName,
                        lastName,
                        password,
                        username)
     VALUES (3,
             'Michael',
             'Watson',
             'xdhhjkd',
             'mike');

INSERT INTO suser (id,
                        firstName,
                        lastName,
                        password,
                        username)
     VALUES (4,
             'Alice',
             'Smith',
             'zvksdfm',
             'alice');

INSERT INTO suser (id,
                        firstName,
                        lastName,
                        password,
                        username)
     VALUES (5,
             'Nancy',
             'Kerr',
             'xmnogpd',
             'nancy');

INSERT INTO suser (id,
                        firstName,
                        lastName,
                        password,
                        username)
     VALUES (6,
             'Jeff',
             'Sprouse',
             'mvbnko',
             'jeff');

INSERT INTO suser (id,
                        firstName,
                        lastName,
                        password,
                        username)
     VALUES (7,
             'Betty',
             'Star',
             'mnhtiep',
             'betty');

INSERT INTO suser (id,
                        firstName,
                        lastName,
                        password,
                        username)
     VALUES (8,
             'John',
             'Tracy',
             'trrtyur',
             'johnny');

ALTER TABLE role ADD CONSTRAINT FK3580769128426C FOREIGN KEY (user_id) REFERENCES suser (id);


CREATE TABLE UserConnection
(
   userId           VARCHAR (255) NOT NULL,
   providerId       VARCHAR (255) NOT NULL,
   providerUserId   VARCHAR (255),
   RANK             INT NOT NULL,
   displayName      VARCHAR (255),
   profileUrl       VARCHAR (512),
   imageUrl         VARCHAR (512),
   accessToken      VARCHAR (255) NOT NULL,
   secret           VARCHAR (255),
   refreshToken     VARCHAR (255),
   expireTime       NUMBER (20)
);

ALTER TABLE UserConnection ADD (
  CONSTRAINT PK_UserConnection
 PRIMARY KEY
 (userId, providerId, providerUserId)
 );