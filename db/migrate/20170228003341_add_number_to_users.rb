class AddNumberToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :phone, :string
  end
end
