class CustumersController < ApplicationController
  def index
    if params[:keywords].present?
      @keywords = params[:keywords]
      custumer_search_term = CustumerSearchTerm.new(@keywords)
      @custumers = Custumer.where(
        custumer_search_term.where_clause,
        custumer_search_term.where_args).order(custumer_search_term.order)
    else
      @custumers = []
    end
  end
end
