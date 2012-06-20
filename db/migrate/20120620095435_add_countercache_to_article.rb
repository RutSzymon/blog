class AddCountercacheToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :comments_count, :integer, null: false, default: 0
    Article.find_each {|art| art.update_attribute(:comments_count, art.comments.count)}
  end
end
