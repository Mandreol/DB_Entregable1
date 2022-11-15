CREATE TABLE "user" (
  "user_id" serial PRIMARY KEY,
  "user_name" varchar,
  "user_last_name" varchar,
  "user_dni" int,
  "user_birthday" date,
  "user_direction" varchar,
  "user_password" varchar,
  "user_status" varchar,
  "user_rol" int
);

CREATE TABLE "users_curses" (
  "id" uuid PRIMARY KEY,
  "user_id" int,
  "curse_id" int,
  "status" varchar
);

CREATE TABLE "courses" (
  "courese_id" serial PRIMARY KEY,
  "course_title" varchar,
  "course_description" varchar,
  "course_cover_img_url" varchar
);

CREATE TABLE "class_videos" (
  "video_id" uuid PRIMARY KEY,
  "course_class_id" int,
  "class_videos_url" varchar,
  "class_description" varchar
);

CREATE TABLE "curses_categories" (
  "curses_categories_id" uuid PRIMARY KEY,
  "courese_id" int,
  "categori_id" int
);

CREATE TABLE "categories" (
  "categori_id" serial PRIMARY KEY,
  "categori_name" varchar
);

CREATE TABLE "roles" (
  "role_id" serial PRIMARY KEY,
  "role_name" varchar,
  "role_description" varchar
);

ALTER TABLE "users_curses" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("user_id");

ALTER TABLE "user" ADD FOREIGN KEY ("user_rol") REFERENCES "roles" ("role_id");

ALTER TABLE "curses_categories" ADD FOREIGN KEY ("categori_id") REFERENCES "categories" ("categori_id");

ALTER TABLE "users_curses" ADD FOREIGN KEY ("curse_id") REFERENCES "courses" ("courese_id");

ALTER TABLE "class_videos" ADD FOREIGN KEY ("course_class_id") REFERENCES "courses" ("courese_id");

ALTER TABLE "curses_categories" ADD FOREIGN KEY ("courese_id") REFERENCES "courses" ("courese_id");

insert into roles 
(rol_name, rol_description)
values 
('Admin', 'Permisos completos'), 
('Profesor', 'permisos de Profesor'), 
('Alumno', 'Permisos de alumno');

insert into users 
(user_name, user_last_name, user_dni, user_birthday, user_direction, user_password, user_status, user_rol)
values 
('Marco', 'Andreola', 34746720, '03/09/1989', 'Santa Rosa 1548 Bs. As. Argentina', '123445667', 'activo', 1),
('Tannia', 'Santos', 32604951, '20/01/1987', 'Monaco 1256 Bs. As. Argentina', 'verdolaga98', 'activo', 2),
('Gonzalo', 'Matelon', 40234098, '8/12/1997', 'Itulan 1235 Bs. A. Argentina', 'lkjhyuio', 'activo', 3);