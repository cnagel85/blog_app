require 'spec_helper'

describe "StaticPages" do

  let(:base_title) {'My New Blog Web App'}

  describe "Home Page" do
    before  {visit root_path}

    it "should have content 'My New Blog Web App'" do
      page.should have_selector('h1', :text => base_title)
    end
  end

  describe "Contact Page"do
    before  {visit contact_path}

    it "should have content 'My New Blog Web App'" do
      page.should have_selector('h1', :text => "My Contact Info")
    end

    it "should have link 'mailto:corey@example.com'" do
      page.should have_link("Corey@example.com", href: 'mailto:corey@example.com')
    end
  end

end
