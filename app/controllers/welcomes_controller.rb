class WelcomesController < ApplicationController
  layout "application"

  def index
    render :inline => "<% title 'Similis', false %><%= netzke :similis_app %>", :layout => true
  end
end
