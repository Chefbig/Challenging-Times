class PagesController < ApplicationController
  def lizard
    @lizards = "🦎" * (params[:number]).to_i
  end

end
