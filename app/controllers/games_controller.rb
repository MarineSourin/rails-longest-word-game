require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = Array.new(10) { ('A'..'Z').to_a[rand(26)] }
  end

  def score
    @letters = params[:letters]
    @word = params[:word].upcase
    @condition = @word.chars.all? { |letter| @word.count(letter) <= @letters.count(letter) }
    url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    answer = open(url).read
    json = JSON.parse(answer)
    @json = json['found']
  end
end
