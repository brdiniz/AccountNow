class BoxesController < InheritedResources::Base

  def destroy
    destroy!
  rescue Exception => e
    flash[:error] = e.message
    redirect_to(boxes_path)
  end

  def account
    find_account
  end

  def account_edit
    find_account
    if request.post?
      @account.attributes = params[:account]
      if @account.save_payment
        flash[:notice] = "Alteração de Conta realizada com sucesso!"
        redirect_to(@box)
      else
        render :action => "account_edit"
      end
    end
  end

  private
  def find_account
    @box = Box.find(params[:box_id])
    @account = Account.find(params[:id])
  end
end

