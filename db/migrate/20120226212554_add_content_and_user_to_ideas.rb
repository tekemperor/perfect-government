class AddContentAndUserToIdeas < ActiveRecord::Migration
  def self.up
    add_column :ideas, :content, :text
    add_column :ideas, :user_id, :integer

    add_index :ideas, [:user_id]
  end

  def self.down
    remove_column :ideas, :content
    remove_column :ideas, :user_id

    remove_index :ideas, :name => :index_ideas_on_user_id rescue ActiveRecord::StatementInvalid
  end
end
