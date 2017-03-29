class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
    	t.string :first_name
    	t.string  :last_nam
    	t.string :email,              null: false
        t.string :password_digest,    null: false
        t.integer :adhar_no
    	t.date    :dob
    	t.string :gender
    	t.string :state
    	t.string :country

      t.timestamps
    end
  end
end
