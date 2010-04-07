class BankAccountsController < AccountItemController

  def show
    if params[:id].nil?
      find_bank_account(params[:bank_account_id], params[:month_number], params[:year_number])
    else
      find_bank_account(params[:id], DateTime.now.month, DateTime.now.year)
    end
  end

  private
  def find_bank_account(bank_account_id, month, year)
    @bank_account = BankAccount.find(bank_account_id)
    @month = month
    @year = year
  end
end

