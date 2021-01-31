class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @ventas = Ventum.all
  end

  # GET /users/1 or /users/1.json
  def show
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
    @venta = Ventum.find_by(user_id: params[:id])
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        if params[:selected_movie] != "0" && params[:selected_tv_series] == "0"
          puts "entro pelicula"
          @ventasMovie = Ventum.new
          @ventasMovie.user_id = @user.id
          @ventasMovie.movie_id = params[:selected_movie].to_i
          @ventasMovie.save
        elsif params[:selected_tv_series] != "0" && params[:selected_movie] == "0"
          puts "entro serie"
          @ventasTvSerie = Ventum.new
          @ventasTvSerie.user_id = @user.id
          @ventasTvSerie.tv_serie_id = params[:selected_tv_series].to_i
          @ventasTvSerie.save
        elsif params[:selected_movie] != "0" && params[:selected_tv_series] != "0"
          puts "entro pelicula y serie"
          @ventas = Ventum.new
          @ventas.user_id = @user.id
          @ventas.movie_id = params[:selected_movie].to_i
          @ventas.tv_serie_id = params[:selected_tv_series].to_i
          @ventas.save
        end
        
        format.html { redirect_to users_path }
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
            
        @venta = Ventum.find_by(user_id: params[:id])
        if params[:selected_movie] == ["0"] && params[:selected_tv_series] == ["0"]
          @venta.movie_id = nil
          @venta.tv_serie_id = nil
          @venta.save
        elsif params[:selected_movie] != ["0"] && params[:selected_tv_series] != ["0"]
          @venta.movie_id = params[:selected_movie].first
          @venta.tv_serie_id = params[:selected_tv_series].first
          @venta.save
        elsif params[:selected_movie] == ["0"] && params[:selected_tv_series] != ["0"]
          @venta.movie_id = nil
          @venta.tv_serie_id = params[:selected_tv_series].first
          @venta.save
        elsif params[:selected_movie] != ["0"] && params[:selected_tv_series] == ["0"]
          @venta.movie_id = params[:selected_movie].first
          @venta.tv_serie_id = nil
          @venta.save
        end
        if @venta.save
          format.html { redirect_to users_path }
        end
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
