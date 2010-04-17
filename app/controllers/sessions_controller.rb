class SessionsController < InheritedResources::Base
  
  def create
    @session = Session.new(params[:session])
    if @session.save
      session[:id] = @session.id
      session[:current_user] = @session.user.login
      flash[:notice] = "Sessão para #{@session.user.login} criada com sucesso!"
      redirect_to(boxes_path)
    else
      flash[:error] = "Usuário e senha inválidos"
      current_session = nil
      render(:action => 'new')
    end
  end
  
  def destroy
    @session = Session.find_by_id(session[:id])
    @session.destroy if @session
    session[:id] = nil
    redirect_to(new_session_path)
  end
end