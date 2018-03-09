require 'rails_helper'

describe "view spec for home index", type: :feature do

  it "should show response from weather api" do
    visit '/'
    fill_in 'days', with: 1
    click_button 'Go'
    expect(page).to have_content 'Tue Feb 27'
  end

end
