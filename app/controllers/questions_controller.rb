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

  def answer
    @question = params[:question]
    # debugger
    @answer = stupid_answer(@question.to_s)
  end

  # If the message is I am going to work, the coach will answer Great!
  # If the message has a question mark ? at the end, the coach will answer Silly question, get dressed and go to work!.
  # Otherwise the coach will answer I don't care, get dressed and go to work!
  private

    # bug here
    # ActionController::MissingExactTemplate (QuestionsController#answer is missing a template for request formats: text/html)
    # Solvin problem: I had created a new folder to host answer.html.erb with the name answers.
    # the path was correct but the controller only points to the questions folder as it is called questions_controller.
    # The solution was to host answer.html.erb in the questions folder.
    #another possibility would have been to create a new controller.
  def stupid_answer(question)
    if question == "I am going to work"
      "Great!"
      #debugger
    elsif question.end_with?("?")
      "Silly question, get dressed and go to work!."
    else
      "I don't care, get dressed and go to work!"
    end
  end
end
