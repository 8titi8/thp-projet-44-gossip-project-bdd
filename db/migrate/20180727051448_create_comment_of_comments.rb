class CreateCommentOfComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comment_of_comments do |t|
      t.text :content
      t.references :user, foreign_key: true
      t.references :comment, foreign_key: true

      t.timestamps
    end
  end
end
