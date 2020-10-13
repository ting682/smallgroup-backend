# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Topic.destroy_all
Passage.destroy_all

u = User.create(name: 'Ting', password: 'hello', email_address: 'tchung682@gmail.com')

new_topic = Topic.create(title: 'Humility', content: 'We should always have humility under all circumstances', user_id: u.id)

new_topic2 = Topic.create(title: 'Patience', content: 'We should strive to be patient.', user_id: u.id)

new_passage = Passage.create(book: 'Philippians', chapter: '4', verse: '13', content: 'I can do all this through him who gives me strength.', user_id: u.id)

new_passage2 = Passage.create(book: 'Colossians', chapter: '3', verse: '12', content: 'Therefore, as God’s chosen people, holy and dearly loved, clothe yourselves with compassion, kindness, humility, gentleness and patience.', user_id: u.id)

new_passage3 = Passage.create(book: 'Ephesians', chapter: '4', verse: '2', content: 'Be completely humble and gentle; be patient, bearing with one another in love.', user_id: u.id)

new_topic.passages << new_passage2
new_topic.passages << new_passage3
new_topic2.passages << new_passage
new_topic2.passages << new_passage3

comment1 = Comment.create(content: 'I like humility as a topic', user_id: u.id, topic_id: new_topic.id)