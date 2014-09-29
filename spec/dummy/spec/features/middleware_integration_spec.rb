require 'spec_helper'

feature 'Middleware integration' do
  scenario "Integrating the middleware into the Rack stack" do
    expect(Headhunter.runner).to receive(:process).with(posts_path, kind_of(String))
    visit posts_path
  end
end
