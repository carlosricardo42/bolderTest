class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, default: ""
      t.string :first_name
      t.string :last_name
      t.string :role,  default: 'writer'

      t.timestamps null: false
    end
  end
end
