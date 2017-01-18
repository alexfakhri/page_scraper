require 'spec_helper'

feature 'Extracting twitter and github URLs' do

  xscenario 'extracting twitter url' do
    visit '/'
    fill_in :url, with: "​http://aakashjapi.com/"
    click_button 'Get Info'
    expect(page).to have_link "twitter"
  end

end
