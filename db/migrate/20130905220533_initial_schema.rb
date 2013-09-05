class InitialSchema < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :username
      t.string :password_digest
    end

  	create_table :questions do |t|
      t.string  :question_category
      t.string  :question_type
      t.text    :question_text
	    t.string  :choice1
      t.string  :choice2
      t.string  :choice3
      t.string  :choice4
	    t.string  :correct_answer
  	end

    create_table :quiz_setups do |t|
      t.string  :name
      t.integer :quantity1
      t.integer :quantity2
      t.integer :quantity3
      t.integer :quantity4
      t.string  :category1
      t.string  :category2
      t.string  :category3
      t.string  :category4
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
    end
    
    create_table  :categories do |t|
      t.string    :name
    end
    
    create_table  :types do |t|
      t.string    :name
    end
  end
end
