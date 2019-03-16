class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string          :name,            null: false
      t.text            :url,             null: false
      t.string          :shortened_url,   null: false
      t.timestamps
    end
  end
end
