class CreateGossipAndTagJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :gossips, :tags do |t|
      t.references :gossip, foreign_key: true
      t.references :tag, foreign_key: true
  		end
	end
end
