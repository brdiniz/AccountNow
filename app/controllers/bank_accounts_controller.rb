class BankAccountsController < InheritedResources::Base

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
    @month = month.to_s if month.to_i > 9
    @month = "0"+ month.to_s if month.to_i < 10
    @year = year
  end
end

