class BoxesController < InheritedResources::Base

  def destroy
    destroy!
  rescue Exception => e
    flash[:error] = e.message
    redirect_to(people_path)
  end
end

