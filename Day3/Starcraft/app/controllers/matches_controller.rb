class MatchesController < ApplicationController
	def index
		matches = Match.all
  		render json: matches, status: 201 
	end
	def show_by_faction
		faction = params[:faction]
		matches_won = Match.where("winner_faction = ?", faction)
		matches_lost = Match.where("loser_faction = ?", faction)
		overall_won = (matches_won.size / (matches_lost.size + matches_won.size)) * 100
		render json: {overall_won: overall_won ,won: matches_won, lost: matches_lost}
	end
	def show_by_player_id
		matches_won = Match.where("winner_id = ?", params[:id])
		matches_lost = Match.where("loser_id = ?", params[:id])
		overall_won = (matches_won.size / (matches_lost.size + matches_won.size)) * 100
		render json: {overall_won: overall_won ,won: matches_won, lost: matches_lost}
	end
	def show_by_player_faction
		faction = params[:id]
		player_id = params[:player_id]
		matches_won = Match.where("winner_faction = ? <AND></AND> winner_id = ?" , faction, player_id)
		matches_lost = Match.where("loser_faction = ? AND loser_id = ?" , faction, player_id)
		render json: {won: matches_won, lost: matches_lost}
	end
end