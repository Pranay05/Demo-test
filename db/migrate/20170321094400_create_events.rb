class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|

    	t.string :event_name
    	t.string  :location
    	t.text :description
    	t.datetime :start_time
    	t.datetime :end_time
      t.float :latitude
      t.float :longitude
      t.references :user, index: true

      

    
      t.timestamps
    end
  end
end
