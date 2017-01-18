require 'spec_helper'

feature 'Enter URL' do

  xscenario 'submitting a URL' do
    visit '/'
    fill_in :url, with: '​http://aakashjapi.com/'
    click_button 'Get Info'
    expect(page).to have_content '​http://aakashjapi.com/'
  end

end
