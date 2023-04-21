drop database quiz;
CREATE DATABASE quiz;
USE quiz;

CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL
);

CREATE TABLE quizzes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  score INT NOT NULL,
  questions TEXT NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE questions (
  id INT AUTO_INCREMENT PRIMARY KEY,
  question VARCHAR(255) NOT NULL,
  option_1 VARCHAR(255) NOT NULL,
  option_2 VARCHAR(255) NOT NULL,
  option_3 VARCHAR(255) NOT NULL,
  option_4 VARCHAR(255) NOT NULL,
  answer CHAR(1) NOT NULL
);

INSERT INTO questions (question, option_1, option_2, option_3, option_4, answer) 
VALUES ("What event marked the beginning of World War II in Europe?", 
        "The bombing of Pearl Harbor", 
        "The invasion of Poland", 
        "The attack on the Soviet Union", 
        "The sinking of the Lusitania", 
        "2");

INSERT INTO questions (question, option_1, option_2, option_3, option_4, answer) 
VALUES ("Which country did the United States fight in the Vietnam War?", 
        "Japan", 
        "South Korea", 
        "North Vietnam", 
        "France", 
        "3");

INSERT INTO questions (question, option_1, option_2, option_3, option_4, answer) 
VALUES ("Who invented the telephone?", 
        "Alexander Graham Bell", 
        "Thomas Edison", 
        "Albert Einstein", 
        "Benjamin Franklin", 
        "1");

INSERT INTO questions (question, option_1, option_2, option_3, option_4, answer) 
VALUES ("What is the capital city of Brazil?", 
        "São Paulo", 
        "Rio de Janeiro", 
        "Brasília", 
        "Belo Horizonte", 
        "3");

INSERT INTO questions (question, option_1, option_2, option_3, option_4, answer) 
VALUES ("Who wrote the novel 'Pride and Prejudice'?", 
        "Charles Dickens", 
        "Emily Bronte", 
        "Jane Austen", 
        "Virginia Woolf", 
        "3");

INSERT INTO questions (question, option_1, option_2, option_3, option_4, answer) 
VALUES ("What is the largest organ in the human body?", 
        "The brain", 
        "The liver", 
        "The skin", 
        "The heart", 
        "3");

INSERT INTO questions (question, option_1, option_2, option_3, option_4, answer) 
VALUES ("What is the smallest country in the world?", 
        "Monaco", 
        "Vatican City", 
        "San Marino", 
        "Liechtenstein", 
        "2");

INSERT INTO questions (question, option_1, option_2, option_3, option_4, answer) 
VALUES ("What is the name of the world's largest desert?", 
        "The Sahara", 
        "The Gobi", 
        "The Mojave", 
        "The Kalahari", 
        "1");

INSERT INTO questions (question, option_1, option_2, option_3, option_4, answer) 
VALUES ("Who was the first man to walk on the moon?", 
        "Buzz Aldrin", 
        "Neil Armstrong", 
        "Yuri Gagarin", 
        "Alan Shepard", 
        "2");

INSERT INTO questions (question, option_1, option_2, option_3, option_4, answer) 
VALUES ("What is the chemical symbol for gold?", 
        "Ag", 
        "Au", 
        "Cu", 
        "Fe", 
        "2");
INSERT INTO questions (question, option_1, option_2, option_3, option_4, answer) VALUES ('What year was the first iPhone released?', '2005', '2006', '2007', '2008', 3);
INSERT INTO questions (question, option_1, option_2, option_3, option_4, answer) VALUES ('What is the capital city of Canada?', 'Toronto', 'Montreal', 'Ottawa', 'Vancouver', 3);
INSERT INTO questions (question, option_1, option_2, option_3, option_4, answer) VALUES ('Who directed the movie Jurassic Park?', 'Steven Spielberg', 'James Cameron', 'Martin Scorsese', 'Christopher Nolan', 1);
INSERT INTO questions (question, option_1, option_2, option_3, option_4, answer) VALUES ('What is the smallest country in the world?', 'Vatican City', 'Monaco', 'Nauru', 'Tuvalu', 1);
INSERT INTO questions (question, option_1, option_2, option_3, option_4, answer) VALUES ('Which planet is closest to the sun?', 'Venus', 'Mars', 'Mercury', 'Jupiter', 3);
INSERT INTO questions (question, option_1, option_2, option_3, option_4, answer) VALUES ('What is the tallest mammal?', 'Giraffe', 'Elephant', 'Rhino', 'Hippopotamus', 1);
INSERT INTO questions (question, option_1, option_2, option_3, option_4, answer) VALUES ('What is the capital city of Japan?', 'Kyoto', 'Osaka', 'Tokyo', 'Hiroshima', 3);
INSERT INTO questions (question, option_1, option_2, option_3, option_4, answer) VALUES ('Which country gifted the Statue of Liberty to the US?', 'Italy', 'Spain', 'France', 'Germany', 3);
INSERT INTO questions (question, option_1, option_2, option_3, option_4, answer) VALUES ('What is the highest mountain in Africa?', 'Mount Kilimanjaro', 'Mount Kenya', 'Mount Everest', 'Mount Aconcagua', 1);
INSERT INTO questions (question, option_1, option_2, option_3, option_4, answer) VALUES ('Which animal is considered to be the "King of the Jungle"?', 'Tiger', 'Lion', 'Leopard', 'Jaguar', 2);