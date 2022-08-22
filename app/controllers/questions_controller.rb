class QuestionsController < ApplicationController
  def ask
    # code the action
    # router directs "/ask" to this controller action
    @teams = ["Bayern Munich 73-74", "Inter Milan 64-65", "Ajax 71-72", "Liverpool 83--84", "Real Madrid 59-60", "Manchester United 98-99", "Torino 46-47", "Santos 62-63", "Barcelona 91-92"]
    @query = params["team"]
    if @query.nil? || !@query.empty?
      # @query.downcase doesn't work, we replace to .to_s.downcase
      @teams = @teams.select{|team| team.match?(@query.to_s.downcase.gsub(/\s+/, '')) }
    end
  end
end
