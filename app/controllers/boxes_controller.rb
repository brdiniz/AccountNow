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

  def show
    if params[:id].nil?
      find_box_account(params[:box_id], params[:month_number], params[:year_number])
    else
      find_box_account(params[:id], DateTime.now.month, DateTime.now.year)
    end
  end

  private
  def find_box_account(box_id, month, year)
    @box = Box.find(box_id)
    @month = month.to_s if month.to_i > 9
    @month = "0"+ month.to_s if month.to_i < 10
    @year = year
  end

  def find_account
    @box = Box.find(params[:box_id])
    @account = Account.find(params[:id])
  end
end

