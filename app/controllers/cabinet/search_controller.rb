class Cabinet::SearchController < Cabinet::ApplicationController
  def index
    @search_results = PgSearch.multisearch(params[:search_query])
                              .paginate(page: params[:page], per_page: 10)
  end
end
