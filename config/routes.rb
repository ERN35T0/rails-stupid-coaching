Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # A simple route to go to http://localhost:3000/ask
  get "ask", to: "questions#ask"
  # A simple route to go to http://localhost:3000/answer
  get "answer", to: "questions#answer"
end
