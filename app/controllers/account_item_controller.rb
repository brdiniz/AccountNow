class AccountItemController < InheritedResources::Base
  def account
    find_account
  end
  
  def account_delete
    find_account
    @account.delete
    flash[:notice] = "Exclusão de Conta realizada com sucesso!"
    redirect_to (@box || @bank_account)
  end

  def account_edit
    find_account
    if request.post?
      @account.attributes = params[:account]
      if @account.save_payment
        flash[:notice] = "Alteração de Conta realizada com sucesso!"
        redirect_to (@box || @bank_account)
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
    @month = month
    @year = year
  end

  def find_account
    @box = Box.find(params[:box_id]) if params[:box_id]
    @bank_account = BankAccount.find(params[:bank_account_id]) if params[:bank_account_id]
    @account = Account.find(params[:id])
  end
end