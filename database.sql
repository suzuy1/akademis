
-- Create the students table
CREATE TABLE students (
  id SERIAL PRIMARY KEY,
  nim VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  jurusan VARCHAR(255),
  tahun INT,
  alamat TEXT
);

-- Create the lecturers table
CREATE TABLE lecturers (
  id SERIAL PRIMARY KEY,
  nip VARCHAR(255) NOT NULL,
  name VARCHAR(255) NOT NULL,
  departemen VARCHAR(255)
);

-- Create the courses table
CREATE TABLE courses (
  id SERIAL PRIMARY KEY,
  kode VARCHAR(255) NOT NULL,
  nama VARCHAR(255) NOT NULL,
  sks INT,
  lecturer_id INT REFERENCES lecturers(id)
);

-- Create the classes table
CREATE TABLE classes (
  id SERIAL PRIMARY KEY,
  course_id INT REFERENCES courses(id),
  student_id INT REFERENCES students(id)
);

-- Create the schedules table
CREATE TABLE schedules (
  id SERIAL PRIMARY KEY,
  course_id INT REFERENCES courses(id),
  hari VARCHAR(255),
  jam TIME,
  ruangan VARCHAR(255)
);

-- Create the grades table
CREATE TABLE grades (
  id SERIAL PRIMARY KEY,
  student_id INT REFERENCES students(id),
  course_id INT REFERENCES courses(id),
  nilai VARCHAR(1)
);
