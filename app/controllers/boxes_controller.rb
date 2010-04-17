class BoxesController < AccountItemController
  before_filter :maintain_session_and_user
  
  def destroy
    destroy!
  rescue Exception => e
    flash[:error] = e.message
    redirect_to(boxes_path)
  end
end

