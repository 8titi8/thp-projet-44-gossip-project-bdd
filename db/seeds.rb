# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do # creation de 10 villes
  city = City.create(name: Faker::Address.city, 
  					postal_code: Faker::Address.postcode)
end

10.times do # creation de 10 utilisateurs
  user = User.create(first_name: Faker::Name.first_name, 
  					last_name: Faker::Name.last_name, 
  					description: Faker::GameOfThrones.quote, 
  					email: Faker::Internet.email, 
  					age: rand(15..99), 
  					city_id: rand((City.first.id)..(City.last.id)))
end

20.times do # creation 20 gossips
  gossip = Gossip.create(title: Faker::Friends.character, 
  						content: Faker::Friends.quote,
  						user_id: rand((User.first.id)..(User.last.id)))
end

10.times do # creation 10 tags et relation entre tag et gossip
  tag = Tag.create(title: Faker::NewGirl.character,
  					user_id: rand((User.first.id)..(User.last.id)))
  gossips_tags = tag.gossips << [Gossip.find(rand((Gossip.first.id)..(Gossip.last.id))), Gossip.find(rand((Gossip.first.id)..(Gossip.last.id)))]
end

#private_message = PrivateMessage.create(content: Faker::Friends.quote, 
#										recipient_id: rand((User.first.id)..(User.last.id)), 
#										sender_id: rand((User.first.id)..(User.last.id)))

20.times do # creation 20 commentaires
  comment = Comment.create(content: Faker::HarryPotter.quote, 
  							user_id: rand((User.first.id)..(User.last.id)), 
  							gossip_id: rand((Gossip.first.id)..(Gossip.last.id)))
end

20.times do # creation 10 likes gossip
  like = Like.create(user_id: rand((User.first.id)..(User.last.id)), 
  					gossip_id: rand((Gossip.first.id)..(Gossip.last.id)))
 end	


10.times do # creation de commentaires de commentaires
	comments_to_comments = CommentOfComment.create(content: Faker::Friends.quote, 
													comment_id: rand((Comment.first.id)..(Comment.last.id)),
													user_id: rand((User.first.id)..(User.last.id)))
end