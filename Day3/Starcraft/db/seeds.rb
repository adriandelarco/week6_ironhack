# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Player.create([{ name: 'Polio' }, { name: 'Tyrlo' }, { name: 'Viwon' }, { name: 'Yubolo' }, { name: 'Wolfos' }])
Match.create([{ winner_faction: 'Terrans', loser_faction: 'Zerg', duration: 50, date: Time.now - 545154, winner_id: 1, loser_id: 2 },
	{ winner_faction: 'Terrans', loser_faction: 'Zerg', duration: 50, date: Time.now - 545154, winner_id: 1, loser_id: 2 },
	{ winner_faction: 'Terrans', loser_faction: 'Zerg', duration: 50, date: Time.now - 545154, winner_id: 1, loser_id: 2 },
	{ winner_faction: 'Terrans', loser_faction: 'Zerg', duration: 50, date: Time.now - 545154, winner_id: 1, loser_id: 2 },
	{ winner_faction: 'Terrans', loser_faction: 'Zerg', duration: 50, date: Time.now - 545154, winner_id: 1, loser_id: 2 },
	])