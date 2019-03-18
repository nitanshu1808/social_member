class AddEmailandPasswordToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :email,              :string, null: false, default: ""
    add_column :members, :encrypted_password, :string, null: false, default: ""
  end
end
