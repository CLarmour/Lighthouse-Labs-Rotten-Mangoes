class SearchController < ApplicationController

  def index
    title_or_director = params[:title_or_director]
    runtime = params[:runtime_in_minutes].to_i

    query = "(title like '#{params[:title_or_director]}%' or director like '#{params[:title_or_director]}%')"

    query += " and runtime_in_minutes < 90" if runtime < 90
    query += " and runtime_in_minutes >= 90 and runtime_in_minutes <= 120" if runtime >= 90 && runtime <= 120
    query += " and runtime_in_minutes > 120" if runtime > 120

    @movies = Movie.where(query)

  end

end
