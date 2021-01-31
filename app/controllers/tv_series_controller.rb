class TvSeriesController < ApplicationController
  before_action :set_tv_series, only: %i[ show edit update destroy ]

  # GET /tv_series or /tv_series.json
  def index
    @tv_series = TvSerie.all
  end

  # GET /tv_series/1 or /tv_series/1.json
  def show
  end

  # GET /tv_series/new
  def new
    @tv_series = TvSerie.new
  end

  # GET /tv_series/1/edit
  def edit
  end

  # POST /tv_series or /tv_series.json
  def create
    @tv_series = TvSerie.new(tv_series_params)

    respond_to do |format|
      if @tv_series.save
        format.html { redirect_to @tv_series, notice: "Tv serie was successfully created." }
        format.json { render :show, status: :created, location: @tv_series }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tv_series.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tv_series/1 or /tv_series/1.json
  def update
    respond_to do |format|
      if @tv_series.update(tv_series_params)
        format.html { redirect_to @tv_series, notice: "Tv serie was successfully updated." }
        format.json { render :show, status: :ok, location: @tv_series }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @tv_series.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tv_series/1 or /tv_series/1.json
  def destroy
    @tv_series.destroy
    respond_to do |format|
      format.html { redirect_to tv_series_url, notice: "Tv serie was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tv_series
      @tv_series = TvSerie.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def tv_series_params
      params.require(:tv_series).permit(:name, :genre, :price, :season)
    end
end
