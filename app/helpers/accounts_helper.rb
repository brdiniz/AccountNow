module AccountsHelper

  def find_account_month_year(month, year)
    initial_date = "#{month}/1/#{year}".to_date.to_s
    final_date = initial_date.to_date.months_since(1)
    self.accounts.find(:all, :conditions => ["payment_date >= ? and payment_date < ?", initial_date, final_date]).sort
  end

  def price_sum(month, year)
    sum = 0
    final_date = "#{month}/1/#{year}".to_date.to_s
    self.accounts.find(:all, :conditions => ["payment_date < ?", final_date]).each do |account|
      sum = sum - account.price if account.kind == "a pagar"
      sum = sum + account.price if account.kind == "a receber"
    end
    sum
  end

  def payment_sum(month, year)
    sum = 0
    final_date = "#{month}/1/#{year}".to_date.to_s
    self.accounts.find(:all, :conditions => ["payment_date < ?", final_date]).each do |account|
      sum = sum - account.payment_price if account.kind == "a pagar" && !account.payment_price.nil?
      sum = sum + account.payment_price if account.kind == "a receber" && !account.payment_price.nil?
    end
    sum
  end
end

