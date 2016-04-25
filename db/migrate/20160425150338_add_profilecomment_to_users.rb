class AddProfilecommentToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profilecomment, :string
  end
end
