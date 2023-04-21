import random
import mysql.connector

# Connect to MySQL database
db = mysql.connector.connect(
  host="localhost",
  user="quiz_user",
  password="quiz",
  database="quiz"
)

# Create cursor to execute SQL queries
cursor = db.cursor()

# Define function to register a new user
def register():
  username = input("Enter a username: ")
  password = input("Enter a password: ")
  cursor.execute("SELECT * FROM users WHERE username = %s", (username,))
  user = cursor.fetchone()
  if user:
    print("Username already exists.")
  else:
    cursor.execute("INSERT INTO users (username, password) VALUES (%s, %s)", (username, password))
    db.commit()
    print("User registered successfully.")

# Define function to login an existing user
def login():
  username = input("Enter your username: ")
  password = input("Enter your password: ")
  cursor.execute("SELECT * FROM users WHERE username = %s AND password = %s", (username, password))
  user = cursor.fetchone()
  if user:
    print("Login successful.")
    return user
  else:
    print("Invalid username or password.")
    return None

# Define function to generate quiz questions
def generate_questions():
  questions = []
  cursor.execute("SELECT * FROM questions ORDER BY RAND() LIMIT 5")
  results = cursor.fetchall()
  for row in results:
    question = {
      "id": row[0],
      "text": row[1],
      "options": [row[2], row[3], row[4], row[5]],
      "answer": row[6]
    }
    random.shuffle(question["options"])
    questions.append(question)
  return questions

# Define function to take a quiz
def take_quiz(user):
  questions = generate_questions()
  score = 0
  print("Answer the following questions (select 1, 2, 3, or 4):")
  for i, question in enumerate(questions):
    print(f"\n{i+1}. {question['text']}")
    for j, option in enumerate(question['options']):
      print(f"{j+1}. {option}")
    answer = int(input("Your answer: "))
    if question['options'][answer-1] == question['answer']:
      score += 1
  percentage = int(score/5 * 100)
  if percentage < 50:
    print(f"\nYou scored {score}/5 ({percentage}%). Please try again!")
    retake = input("Would you like to retake the quiz? (y/n): ")
    if retake == 'y':
      take_quiz(user)
  else:
    message = ''
    if score == 3:
      message = 'Good job!'
    elif score == 4:
      message = 'Excellent work!'
    elif score == 5:
      message = 'You are a genius!'
    print(f"\nYou scored {score}/5 ({percentage}%). {message}")
    cursor.execute("INSERT INTO quizzes (user_id, score, questions) VALUES (%s, %s, %s)",
                   (user[0], score, str(questions)))
    db.commit()

# Define function to show quiz history
def show_history(user):
  cursor.execute("SELECT * FROM quizzes WHERE user_id = %s ORDER BY created_at DESC", (user[0],))
  quizzes = cursor.fetchall()
  if quizzes:
    print("Quiz history:")
    for quiz in quizzes:
      print(f"\nQuiz id: {quiz[0]}")
      print(f"Score: {quiz[2]}/5")
      print(f"Questions: {quiz[3]}")
  else:
    print("You have not taken any quizzes yet.")

# Define function to show quiz statistics
def show_statistics():
  cursor.execute("SELECT AVG(score), MIN(score), MAX(score) FROM quizzes")
  statistics = cursor.fetchone()
  print("\nQuiz statistics:")
  print(f"Average score: {statistics[0]}/5")
  print(f"Lowest score: {statistics[1]}/5")
  print(f"Highest score: {statistics[2]}/5")

# Define main function
def main():
  while True:
    print("\nWelcome to the quiz application!")
    print("1. Register")
    print("2. Login")
    print("3. Quit")
    choice = input("Enter your choice: ")
    if choice == '1':
      register()
    elif choice == '2':
      user = login()
      if user:
        take_quiz(user)
        show_history(user)
    elif choice == '3':
      break
    else:
      print("Invalid choice.")
  show_statistics()

# Run main function
if __name__ == '__main__':
  main()
