class BoxesController < InheritedResources::Base

  def destroy
    destroy!
  rescue Exception => e
    flash[:error] = e.message
    redirect_to(boxes_path)
  end
  
  def account
    @box = Box.find(params[:box_id])
    @account = Account.find(params[:id])
  end
  
  def account_edit
    @box = Box.find(params[:box_id])
    @account = Account.find(params[:id])
  end
  
end

