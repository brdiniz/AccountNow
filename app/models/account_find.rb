module AccountFind

  def find_account_month_year(month, year)
    initial_date = "#{year}-#{month}-01"
    final_date = initial_date.to_date.months_since(1)
    self.accounts.find(:all, :conditions => ["maturity_date >= ? and maturity_date < ?", initial_date, final_date]).sort
  end
end

