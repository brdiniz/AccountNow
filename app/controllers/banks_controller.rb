class BanksController < InheritedResources::Base
  before_filter :maintain_session_and_user
  
end

