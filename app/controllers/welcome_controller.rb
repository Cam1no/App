class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!
  def top
    @articles = Article::Base.all
  end
end
