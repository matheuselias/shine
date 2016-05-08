class CreateCustumers < ActiveRecord::Migration
  def change
    create_table :custumers do |t|
      t.string :first_name, null: false
      t.string :last_name,  null: false
      t.string :email,      null: false
      t.string :username,   null: false
      t.timestamps          null: false
    end

    add_index :custumers, :email,    unique: true
    add_index :custumers, :username, unique: true
  end
end
