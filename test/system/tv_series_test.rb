require "application_system_test_case"

class TvSeriesTest < ApplicationSystemTestCase
  setup do
    @tv_series = tv_series(:one)
  end

  test "visiting the index" do
    visit tv_series_url
    assert_selector "h1", text: "Tv Series"
  end

  test "creating a Tv serie" do
    visit tv_series_url
    click_on "New Tv Serie"

    fill_in "Genre", with: @tv_series.genre
    fill_in "Name", with: @tv_series.name
    fill_in "Price", with: @tv_series.price
    fill_in "Season", with: @tv_series.season
    click_on "Create Tv serie"

    assert_text "Tv serie was successfully created"
    click_on "Back"
  end

  test "updating a Tv serie" do
    visit tv_series_url
    click_on "Edit", match: :first

    fill_in "Genre", with: @tv_series.genre
    fill_in "Name", with: @tv_series.name
    fill_in "Price", with: @tv_series.price
    fill_in "Season", with: @tv_series.season
    click_on "Update Tv serie"

    assert_text "Tv serie was successfully updated"
    click_on "Back"
  end

  test "destroying a Tv serie" do
    visit tv_series_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Tv serie was successfully destroyed"
  end
end
