class AccountsController < InheritedResources::Base
  belongs_to :person

  def create
    create! do |success, failure|
      success.html { redirect_to @account.person }
      failure.html { render :action => "new" }
    end
  end

  def destroy
    destroy! do |format|
      format.html { redirect_to @account }
    end
  rescue Exception => e
    flash[:error] = e.message
    redirect_to(person_account_path)
  end
end
