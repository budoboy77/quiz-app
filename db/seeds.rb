# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Question.create(question_category: 'IT',
				question_type:  'true/false',
				question_text:  'Computers are stupid.',
				choice1:        'True', 
				correct_answer: 'True')

Question.create(question_category: 'IT',
				question_type:  'true/false',
				question_text:  'Bryan is cool.',
				choice1:        'True', 
				correct_answer: 'True')

Question.create(question_category: 'GSS',
				question_type:  'true/false',
				question_text:  'Insurance is cool.',
				choice1:        'True', 
				correct_answer: 'True')

Question.create(question_category: 'GSS',
				question_type:  'true/false',
				question_text:  'Tim is cool.',
				choice1:        'True', 
				correct_answer: 'True')

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

QuizSetup.create(name: 'General',
				quantity1: 2,
				category1: 'IT',
				quantity2: 2,
				category2: 'GSS')

Admin.create(username: 'admin',
			password: 'kungfu',
			password_confirmation: 'kungfu')