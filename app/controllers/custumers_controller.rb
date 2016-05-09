class CustumersController < ApplicationController
  PAGE_SIZE = 10

  def index
    @page = (params[:page] || 0).to_i

    if params[:keywords].present?
      @keywords = params[:keywords]
      custumer_search_term = CustumerSearchTerm.new(@keywords)
      @custumers = Custumer.where(
        custumer_search_term.where_clause,
        custumer_search_term.where_args)
        .order(custumer_search_term.order).
        offset(PAGE_SIZE * @page).limit(PAGE_SIZE)
    else
      @custumers = []
    end

    respond_to do |format|
      format.html {}
      format.json {render json: @custumers}
    end
  end
end
