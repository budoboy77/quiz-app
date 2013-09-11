# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
category1 = Category.create(name: 'GSS')
category2 = Category.create(name: 'IT')
category3 = Category.create(name: 'Communications')

question1 = Question.create(category_id: category2.id,
				type_id:  2,
				question_text:  'Computers are stupid.',
				choice1:        'True', 
				correct_answer: 'True')

question2 = Question.create(category_id: category2.id,
				type_id:  2,
				question_text:  'Bryan is cool.',
				choice1:        'True', 
				correct_answer: 'True')

question3 = Question.create(category_id: category1.id,
				type_id:  2,
				question_text:  'Insurance is cool.',
				choice1:        'True', 
				correct_answer: 'True')

question4 = Question.create(category_id: category1.id,
				type_id:  2,
				question_text:  'Tim is cool.',
				choice1:        'True', 
				correct_answer: 'True')

question5 = Question.create(category_id: category3.id,
				type_id:  2,
				question_text:  'Andy is cool.',
				choice1:        'True', 
				correct_answer: 'True')

# quiz_setup1 = QuizSetup.create(name: 'General')

# question1.quiz_setups << quiz_setup1
# question2.quiz_setups << quiz_setup1
# question3.quiz_setups << quiz_setup1
# question4.quiz_setups << quiz_setup1

user1 = User.create(first_name: 'Bryan',
			last_name: 'White',
			email: 'bew@bryanewhite.com',
			password: '12345',
			password_confirmation: '12345')

user2 = User.create(first_name: 'Bilbo',
			last_name: 'Baggins',
			email: 'bilbo@bagend.com',
			password: '54321',
			password_confirmation: '54321')

# assignment1 = Assignment.create(quiz_setup_id: quiz_setup1.id, user_id: user1.id)
# assignment2 = Assignment.create(quiz_setup_id: quiz_setup1.id, user_id: user2.id)

Admin.create(username: 'admin',
			password: '1629',
			password_confirmation: '1629')

Type.create(name: "Multiple Choice")
Type.create(name: "True/False")
