--
-- PostgreSQL database
--

--DROP FUNCTION GetOptionsByStatusId (id int);
--DROP TRIGGER update_modification_mod_date_error ON error;
--DROP FUNCTION update_modification_date();

--DROP TABLE history;
--DROP TABLE error;
--DROP TABLE user_role;
--DROP TABLE role;
--DROP TABLE userCF;
--DROP TABLE status;
--DROP TABLE urgency;
--DROP TABLE criticalness;

CREATE TABLE userCF (
user_id serial,
login CHARACTER VARYING(255) NOT NULL,
name CHARACTER VARYING(255) NOT NULL,
surname CHARACTER VARYING(255) NOT NULL,
password CHARACTER VARYING(255) NOT NULL,
CONSTRAINT user_id_pk PRIMARY KEY(user_id),
CONSTRAINT login_unique UNIQUE (login)
);

CREATE TABLE role (
role_id serial,
name CHARACTER VARYING(255),
CONSTRAINT role_id_pk PRIMARY KEY(role_id)
);

CREATE TABLE user_role (
user_role_id serial,
user_id bigint NOT NULL,
role_id bigint NOT NULL,
CONSTRAINT user_role_id PRIMARY KEY(user_role_id),

CONSTRAINT fk_user_id FOREIGN KEY(user_id)
REFERENCES userCF(user_id) ON DELETE CASCADE,
CONSTRAINT fk_role_id FOREIGN KEY(role_id)
REFERENCES role(role_id) ON DELETE CASCADE

---CONSTRAINT user_role_unique UNIQUE (user_id, role_id)
);

CREATE TABLE status (
status_id serial,
name CHARACTER VARYING(255) NOT NULL,
CONSTRAINT status_id_pk PRIMARY KEY(status_id)
);

-- срочность
CREATE TABLE urgency (
urgency_id serial,
name CHARACTER VARYING(255) NOT NULL,
CONSTRAINT urgency_id_pk PRIMARY KEY(urgency_id)
);

-- критичность
CREATE TABLE criticalness (
criticalness_id serial,
name CHARACTER VARYING(255) NOT NULL,
CONSTRAINT criticalness_id_pk PRIMARY KEY(criticalness_id)
);

CREATE TABLE error (
error_id serial,
date timestamp DEFAULT CURRENT_TIMESTAMP,
short_description CHARACTER VARYING(255) NOT NULL,
long_description CHARACTER VARYING(5000) NOT NULL,
user_id bigint NOT NULL,
status_id bigint NOT NULL,
urgency_id bigint NOT NULL,
criticalness_id bigint NOT NULL,

CONSTRAINT error_id_pk PRIMARY KEY(error_id),

CONSTRAINT fk_user_id FOREIGN KEY(user_id)
REFERENCES userCF(user_id) ON DELETE CASCADE,
CONSTRAINT fk_status_id FOREIGN KEY(status_id)
REFERENCES status(status_id) ON DELETE CASCADE,
CONSTRAINT fk_urgency_id FOREIGN KEY(urgency_id)
REFERENCES urgency(urgency_id) ON DELETE CASCADE,
CONSTRAINT fk_criticalness_id FOREIGN KEY(criticalness_id)
REFERENCES criticalness(criticalness_id) ON DELETE CASCADE
);

CREATE TABLE history (
history_id serial,
date timestamp DEFAULT CURRENT_TIMESTAMP,
status_id bigint NOT NULL,
comment CHARACTER VARYING(5000) NOT NULL,
user_id bigint NOT NULL,
error_id bigint NOT NULL,

CONSTRAINT history_id_pk PRIMARY KEY(history_id),

CONSTRAINT fk_user_id FOREIGN KEY(user_id)
REFERENCES userCF(user_id) ON DELETE CASCADE,
CONSTRAINT fk_status_id FOREIGN KEY(status_id)
REFERENCES status(status_id) ON DELETE CASCADE,
CONSTRAINT fk_error_id FOREIGN KEY(error_id)
REFERENCES error(error_id) ON DELETE CASCADE
);

--- password = '777'
INSERT INTO usercf (login, name, surname, password) VALUES ('user', 'Марина', 'Головкина', 'F1C1592588411002AF340CBAEDD6FC33');

--- password = '123'
INSERT INTO usercf (login, surname, name, password) VALUES ('admin', 'Назарова', 'Мария', '202CB962AC59075B964B07152D234B70');

INSERT INTO role (name) VALUES ('user');
INSERT INTO role (name) VALUES ('admin');

INSERT INTO user_role (user_id, role_id) VALUES (1, 1);
INSERT INTO user_role (user_id, role_id) VALUES (2, 1);
INSERT INTO user_role (user_id, role_id) VALUES (2, 2);

INSERT INTO status (name) VALUES ('Новая'); -- изменился на статус "Новая"
INSERT INTO status (name) VALUES ('Открытая');
INSERT INTO status (name) VALUES ('Решенная');
INSERT INTO status (name) VALUES ('Закрытая');

INSERT INTO urgency (name) VALUES ('Очень срочно');
INSERT INTO urgency (name) VALUES ('Срочно');
INSERT INTO urgency (name) VALUES ('Не срочно');
INSERT INTO urgency (name) VALUES ('Совсем не срочно');

INSERT INTO criticalness (name) VALUES ('Авария');
INSERT INTO criticalness (name) VALUES ('Критичная');
INSERT INTO criticalness (name) VALUES ('Некритичная');
INSERT INTO criticalness (name) VALUES ('Запрос на изменение');

CREATE OR REPLACE FUNCTION public.update_modification_date()
RETURNS trigger AS
$BODY$
BEGIN
NEW.date = now();
RETURN NEW;
END;
$BODY$
LANGUAGE plpgsql VOLATILE
COST 100;

CREATE TRIGGER update_modification_mod_date_error
BEFORE UPDATE
ON error
FOR EACH ROW
EXECUTE PROCEDURE public.update_modification_date();

CREATE OR REPLACE FUNCTION GetOptionsByStatusId(id int) 
RETURNS SETOF status AS
$BODY$
DECLARE
	st status%rowtype;
BEGIN
	
	FOR st IN
		SELECT * FROM status
		WHERE
			id = 3 AND status_id IN (
				id-1, id, id+1
			)
			OR
				status_id IN (
					id, id+1
				)
	LOOP
		RETURN NEXT st;
	END LOOP;
	RETURN;
END
$BODY$
LANGUAGE 'plpgsql';