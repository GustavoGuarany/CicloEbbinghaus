class AgendaRevisoesController < RevisoesController
  before_action :authenticate_user!

  def index 
    super                                                                            
  end

end
