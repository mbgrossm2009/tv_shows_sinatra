require "spec_helper"

feature "user adds a new TV show" do
  # As a TV fanatic
  # I want to add one of my favorite shows
  # So that I can encourage others to binge watch it
  #
  # Acceptance Criteria:
  # * I must provide the title, network, and starting year.
  # * I can optionally provide the final year, genre, and synopsis.
  # * The synopsis can be no longer than 5000 characters.
  # * The starting year and ending year (if provided) must be
  #   greater than 1900.
  # * The genre must be one of the following: Action, Mystery,
  #   Drama, Comedy, Fantasy
  # * If any of the above validations fail, the form should be
  #   re-displayed with the failing validation message.
  scenario "successfully add a new show" do
    visit "/television_shows/new"
    fill_in 'Title', with: "The Blacklist"
    fill_in 'Network', with: "NBC"
    fill_in 'starting_year', with: "2013"
    fill_in 'ending_year', with: "2017"
    click_button 'Add TV Show'
    expect(page).to have_content ("The Blacklist (NBC)")
  end

  scenario 'fail to add a show with invalid information' do
    visit '/television_shows/new'
    fill_in 'title', with: nil
    fill_in 'network', with: "NBC"
    fill_in 'starting_year', with: "2013"
    fill_in 'ending_year', with: "2017"
    click_button 'Add TV Show'
    expect(page).to have_content ("Title can't be blank")


      visit '/television_shows/new'
      fill_in 'title', with: "Spongebob"
      fill_in 'network', with: nil
      fill_in 'starting_year', with: "2013"
      fill_in 'ending_year', with: "2017"
      click_button 'Add TV Show'
      expect(page).to have_content ("Network can't be blank")

      visit '/television_shows/new'
      fill_in 'title', with: "Spongebob"
      fill_in 'network', with: "Nickelodeon"
      fill_in 'starting_year', with: nil
      fill_in 'ending_year', with: "2017"
      click_button 'Add TV Show'

      expect(page).to have_content ("Starting year can't be blankStarting year is not a number")
end


end
