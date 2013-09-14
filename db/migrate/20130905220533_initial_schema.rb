class InitialSchema < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :username
      t.string :password_digest
    end

  	create_table :questions do |t|
      t.integer :category_id
      t.integer :type_id
      t.text    :question_text
	    t.string  :choice1
      t.string  :choice2
      t.string  :choice3
      t.string  :choice4
	    t.string  :correct_answer
  	end

    create_table :quiz_setups do |t|
      t.string  :name
    end

    create_table :questionsquizsetups do |t|
      t.integer :question_id
      t.integer :quiz_setup_id
    end
      
    create_table :users do |t|
      t.string  :first_name
      t.string  :last_name
      t.string  :email
      t.string  :password_digest
    end
    
    create_table :assignments do |t|
      t.integer  :user_id
      t.integer  :quiz_setup_id
      t.integer  :score
    end
    
    create_table  :categories do |t|
      t.string    :name
    end
    
    create_table  :types do |t|
      t.string    :name
    end

    create_table  :quiz_results do |t|
      t.integer   :quiz_setup_id
      t.integer   :question_id
      t.integer   :user_id
      t.string    :user_answer
      t.boolean   :is_correct
    end

  end
end
