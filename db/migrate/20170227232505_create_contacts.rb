class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :number
      t.string :email
      t.integer :user_id
      t.timestamps
    end
  end
end
