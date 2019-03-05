class CreateNumbers < ActiveRecord::Migration[5.2]
  def change
    create_table :numbers do |t|
      t.integer :user_id
      t.string :phone
      t.string :description
      t.timestamps
    end
  end
end
