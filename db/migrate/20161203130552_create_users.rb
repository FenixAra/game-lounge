class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users, id: false do |t|
      t.uuid :id, primary_key: true
      t.text :email
      t.text :password_digest
      t.text :first_name
      t.text :last_name
      t.text :mobile
      t.boolean :verified
      t.timestamps
    end
    add_index :users, :email
  end
end
