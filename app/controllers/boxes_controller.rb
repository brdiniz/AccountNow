class BoxesController < InheritedResources::Base

  def destroy
    destroy!
  rescue Exception => e
    flash[:error] = e.message
    redirect_to(boxes_path)
  end
end

