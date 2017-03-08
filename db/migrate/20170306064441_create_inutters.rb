class CreateInutters < ActiveRecord::Migration
  def change
    create_table :inutters do |t|
      t.string :title
      t.text :content

      t.timestamps null: false
    end
  end
end
