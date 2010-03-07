class Account < ActiveRecord::Base
  belongs_to :person
  belongs_to :box
  belongs_to :contract
  belongs_to :bank_account
  belongs_to :situation

  KINDS = ["a pagar", "a receber"]

  validates_presence_of :kind, :bank_account_id, :person_id, :document, :price, :maturity_date, :box_id, :payment_date
  validate :validate_maturity_date

  def <=>(other_account)
    self.maturity_date <=> other_account.maturity_date
  end

  def save_payment
    return false unless validate_update_payment
    self.save
    return true
  end

  private
  def validate_update_payment
    return true unless !self.situation.nil?
    errors.add_on_blank(:payment_price, 'é um campo obrigatório') if self.situation.id == 2
    return errors.empty?
  end

  def validate_maturity_date
    return unless !self.nil? && !self.bank_account.nil?
    errors.add(:payment_date, "menor que data inicial da conta") if self.bank_account.opening_balance_date > self.payment_date
  end
end

