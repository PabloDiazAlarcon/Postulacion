class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @search = User.all.search(params[:q])
    @users = @search.result.page(params[:page]).per(10)
  end

  # GET /users/1 or /users/1.json
  def show
    @search_movies = VentaMovie.where(user_id: params[:id]).search(params[:q])
    @movies = @search_movies.result.includes(:user, :movie).page(params[:page]).per(10)
    
    @search_tv_series = VentaTvSerie.where(user_id: params[:id]).search(params[:q])
    @tv_series = @search_tv_series.result.page(params[:page]).per(10)
  end

  # GET /users/new
  def new
    @user = User.new
    @movie = Movie.all
    @tv_serie = TvSerie.all
  end

  # GET /users/1/edit
  def edit
    @movie = Movie.all
    @tv_serie = TvSerie.all
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save

        a = params[:selected_movie].to_a
        b = params[:selected_movie].first
        a.delete(b)
        @selected_movies = a
        c = params[:selected_tv_series].to_a
        d = params[:selected_tv_series].first
        c.delete(d)
        @selected_tv_series = c

        for i in 0..@selected_movies.length
          @movie_id = @selected_movies[i].to_s.gsub('"', '').gsub('[', '').gsub(']', '').to_i
          if @movie_id == 0
          else
            @venta_movie = VentaMovie.new
            @venta_movie.user_id = @user.id
            @venta_movie.movie_id = @movie_id
            @venta_movie.save
          end
        end

        for x in 0..@selected_tv_series.length
          @tv_serie_id = @selected_tv_series[x].to_s.gsub('"', '').gsub('[', '').gsub(']', '').to_i
          if @tv_serie_id == 0
          else
            @venta_tv_serie = VentaTvSerie.new
            @venta_tv_serie.user_id = @user.id
            @venta_tv_serie.tv_serie_id = @tv_serie_id
            @venta_tv_serie.save
          end
        end
        
        if @venta_movie.save && @venta_tv_serie.save
          format.html { redirect_to users_path }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        @venta_movies = VentaMovie.where(user_id: params[:id])
        @venta_tv_series = VentaTvSerie.where(user_id: params[:id])
        a = params[:selected_movie].to_a
        b = params[:selected_movie].first
        a.delete(b)
        @selected_movies = a
        c = params[:selected_tv_series].to_a
        d = params[:selected_tv_series].first
        c.delete(d)
        @selected_tv_series = c
        
        if @selected_movies.first == ["0"]
          @venta_movies.destroy_all
        else
          @venta_movies.destroy_all
          for i in 0..@selected_movies.length
            @movie_id = @selected_movies[i].to_s.gsub('"', '').gsub('[', '').gsub(']', '').to_i

            if @movie_id == 0
            else
              @venta_movie = VentaMovie.new
              @venta_movie.user_id = @user.id
              @venta_movie.movie_id = @movie_id
              @venta_movie.save
            end

          end
        end

        if @selected_tv_series.first == ["0"]
          @venta_tv_series.destroy_all
        else
          @venta_tv_series.destroy_all
          for x in 0..@selected_tv_series.length
            @tv_serie_id = @selected_tv_series[x].to_s.gsub('"', '').gsub('[', '').gsub(']', '').to_i

            if @tv_serie_id == 0
            else
              @venta_tv_serie = VentaTvSerie.new
              @venta_tv_serie.user_id = @user.id
              @venta_tv_serie.tv_serie_id = @tv_serie_id
              @venta_tv_serie.save
            end

          end
        end
        
          format.html { redirect_to users_path }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :name)
    end
end
