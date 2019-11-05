class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      # t.string :address
      # t.string :city
      # t.string :state
      t.string :email, index: { unique: true }
      t.string :password_digest
      t.boolean :activated, default: false
      t.boolean :admin, default: false
      t.string :activation_digest
      t.string :password_reset_digest
      t.timestamps
    end
  end
end
