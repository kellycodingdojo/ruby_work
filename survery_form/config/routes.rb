Rails.application.routes.draw do
  root 'surveys#index'
  get 'surveys/result'
  post 'survey' => 'surveys#process_survey'
end
