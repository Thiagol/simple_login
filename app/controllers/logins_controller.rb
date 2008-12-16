class LoginsController < ApplicationController

  def login
  	if request.post?
  		if Usuario.find_by_usuario_and_senha(params[:nome], params[:senha])
  			page.redirect_to :controller => 'usuarios', :action => 'index'
  		end
  	end
  end

end
