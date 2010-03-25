module AccountsHelper

  def find_account_month_year(month, year)
    initial_date = "#{month}/1/#{year}".to_date.to_s
    final_date = initial_date.to_date.months_since(1)
    self.accounts.find(:all, :conditions => ["payment_date >= ? and payment_date < ?", initial_date, final_date]).sort
  end

  def price_sum(month, year)
    sum = 0
    final_date = "#{month}/1/#{year}".to_date.to_s
    sum = sum + Account.sum(:price, :conditions => [condition, final_date, "a receber", self.id])
    sum = sum - Account.sum(:price, :conditions => [condition, final_date, "a pagar", self.id])
    sum
  end

  def payment_sum(month, year)
    sum = 0
    final_date = "#{month}/1/#{year}".to_date.to_s
    sum = sum + Account.sum(:payment_price, :conditions => [condition, final_date, "a receber", self.id])
    sum = sum - Account.sum(:payment_price, :conditions => [condition, final_date, "a pagar", self.id])
    sum
  end
  
  private
  def condition
    "payment_date < ? AND kind = ? AND #{self.class.to_s.underscore}_id = ?"
  end
end

