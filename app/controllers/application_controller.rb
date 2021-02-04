class ApplicationController < ActionController::Base

  
  def delete_venta_movie_from_show
    @venta_movie = VentaMovie.find(params[:id])
    @venta_movie.destroy
    redirect_to user_path(params[:user_id])
  end

  def delete_venta_tv_serie_from_show
    @venta_tv_serie = VentaTvSerie.find(params[:id])
    @venta_tv_serie.destroy
    redirect_to user_path(params[:user_id])
  end

end
