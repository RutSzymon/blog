class CreateArticlesTags < ActiveRecord::Migration
  def up
    create_table :articles_tags do |t|
      t.integer :article_id
      t.integer :tag_id
      # t.timestamps
    end  
  end

  def down
    drop_table :articles_tags
  end
end
