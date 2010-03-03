class Account < ActiveRecord::Base
  belongs_to :person
  belongs_to :box
  belongs_to :contract
  belongs_to :bank_account
  belongs_to :situation

  KINDS = ["a pagar", "a receber"]

  validates_presence_of :kind, :bank_account_id, :person_id, :document, :price, :maturity_date, :box_id
  
  def save_payment
    return true unless !self.situation.nil?
    return false unless validate_update_payment
    self.save
    return true
  end
  
  private
  def validate_update_payment
    errors.add_on_blank(:payment_date, 'é um campo obrigatório') if self.situation.id == 2
    errors.add_on_blank(:payment_price, 'é um campo obrigatório') if self.situation.id == 2
    
    return errors.empty?
  end
end

