class AddEmailandPasswordToMember < ActiveRecord::Migration[5.2]
  def change
    add_column :members, :email,    :string, null: false, default: ""
    add_column :members, :password, :string, null: false, default: ""
  end
end
