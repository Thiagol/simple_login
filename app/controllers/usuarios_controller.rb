class UsuariosController < ApplicationController
	before_filter :autenticacao,:except => :new

  def index
  	if request.post?
  		@usuarios = Usuario.find(:dadosUsuario)
  	else
  		@usuarios = Usuario.find(:all)
  	end

  end

  def new
  	if request.post?
  		@usuario = Usuario.new(params[:dadosUsuario])
  		@usuario.save
  	end
  end

  def edit
  end

private
  def autenticacao
  	unless Usuario.find_by_id(session[:id_usuario])
  		redirect_to(:controller => "logins", :action => "login")
  	end
  end

end
