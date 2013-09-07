# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
question1 = Question.create(question_category: 'IT',
				question_type:  'true/false',
				question_text:  'Computers are stupid.',
				choice1:        'True', 
				correct_answer: 'True')

question2 = Question.create(question_category: 'IT',
				question_type:  'true/false',
				question_text:  'Bryan is cool.',
				choice1:        'True', 
				correct_answer: 'True')

question3 = Question.create(question_category: 'GSS',
				question_type:  'true/false',
				question_text:  'Insurance is cool.',
				choice1:        'True', 
				correct_answer: 'True')

question4 = Question.create(question_category: 'GSS',
				question_type:  'true/false',
				question_text:  'Tim is cool.',
				choice1:        'True', 
				correct_answer: 'True')

quiz_setup1 = QuizSetup.create(name: 'General')

question1.quiz_setups << quiz_setup1
question2.quiz_setups << quiz_setup1
question3.quiz_setups << quiz_setup1
question4.quiz_setups << quiz_setup1

User.create(first_name: 'Bryan',
			last_name: 'White',
			email: 'bew@bryanewhite.com',
			password: '12345',
			password_confirmation: '12345')

User.create(first_name: 'Bilbo',
			last_name: 'Baggins',
			email: 'bilbo@bagend.com',
			password: '54321',
			password_confirmation: '54321')

Assignment.create(quiz_setup_id: 1,
			user_id: 1)

Admin.create(username: 'admin',
			password: 'kungfu',
			password_confirmation: 'kungfu')

Category.create(name: 'GSS')
Category.create(name: 'IT')
Category.create(name: 'Communications')

Type.create(name: "Multiple Choice")
Type.create(name: "True/False")