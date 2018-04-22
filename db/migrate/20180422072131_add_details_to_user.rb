class AddDetailsToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :sex, :boolean
    add_column :users, :age, :integer
    add_column :users, :position, :string
  end
end
