class CreateHeadings < ActiveRecord::Migration[5.2]
  def change
    create_table :headings do |t|
      t.references :member,   null: false
      t.text       :text,     null: false
      t.string     :tag,      null: false
      t.timestamps
    end
  end
end
