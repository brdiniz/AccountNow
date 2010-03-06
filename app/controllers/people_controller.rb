class PeopleController < InheritedResources::Base

  def destroy
    destroy!
  rescue Exception => e
    flash[:error] = e.message
    redirect_to(people_path)
  end

  def show
    if params[:id].nil?
      find_person_account(params[:person_id], params[:month_number], params[:year_number])
    else
      find_person_account(params[:id], DateTime.now.month, DateTime.now.year)
    end
  end

  private
  def find_person_account(person_id, month, year)
    @person = Person.find(person_id)
    @month = month.to_s if month.to_i > 9
    @month = "0"+ month.to_s if month.to_i < 10
    @year = year
  end
end

