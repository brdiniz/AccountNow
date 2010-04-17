class ContractsController < InheritedResources::Base
  before_filter :maintain_session_and_user
  
  belongs_to :person

  def create
    create! do |success, failure|
      success.html { redirect_to @contract.person }
      failure.html { render :action => "new" }
    end
  end

  def destroy
    destroy! do |format|
      format.html { redirect_to @person }
    end
  rescue Exception => e
    flash[:error] = e.message
    redirect_to(person_path(@person))
  end
end

