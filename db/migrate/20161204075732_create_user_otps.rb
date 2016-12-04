class CreateUserOtps < ActiveRecord::Migration[5.0]
  def change
    create_table :user_otps do |t|
      t.text :email
      t.text :otp
      t.timestamp :expires_at
    end
    add_index :user_otps, :email
  end
end
