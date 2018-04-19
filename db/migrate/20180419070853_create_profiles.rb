class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.integer :user_id, :index => true
      t.string  :email
      t.string  :name
      t.boolean :sex
      t.integer :age
      t.string  :position
      t.timestamps
    end
  end
end
