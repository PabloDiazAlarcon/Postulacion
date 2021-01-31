require 'test_helper'

class TvSeriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tv_series = tv_series(:one)
  end

  test "should get index" do
    get tv_series_url
    assert_response :success
  end

  test "should get new" do
    get new_tv_series_url
    assert_response :success
  end

  test "should create tv_series" do
    assert_difference('TvSerie.count') do
      post tv_series_url, params: { tv_series: { genre: @tv_series.genre, name: @tv_series.name, price: @tv_series.price, season: @tv_series.season } }
    end

    assert_redirected_to tv_series_url(TvSerie.last)
  end

  test "should show tv_series" do
    get tv_series_url(@tv_series)
    assert_response :success
  end

  test "should get edit" do
    get edit_tv_series_url(@tv_series)
    assert_response :success
  end

  test "should update tv_series" do
    patch tv_series_url(@tv_series), params: { tv_series: { genre: @tv_series.genre, name: @tv_series.name, price: @tv_series.price, season: @tv_series.season } }
    assert_redirected_to tv_series_url(@tv_series)
  end

  test "should destroy tv_series" do
    assert_difference('TvSerie.count', -1) do
      delete tv_series_url(@tv_series)
    end

    assert_redirected_to tv_series_url
  end
end
