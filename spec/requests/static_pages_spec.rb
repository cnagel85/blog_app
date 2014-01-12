require 'spec_helper'

describe "StaticPages" do

  subject { page }

  describe "Home Page" do
    before  { visit root_path }

    it { should have_selector('h1', text: "Corey Elliot Nagel") }
    it { should have_selector('title', text: "Corey Nagel - Blog") }
    it { should have_link('Sign In', href: signin_path) }

    describe "for signed-in users" do
      let(:user) { FactoryGirl.create(:user) }
      let!(:p1) { FactoryGirl.create(:post, user: user, content: "the first post") }
      let!(:p2) { FactoryGirl.create(:post, user: user, content: "the second post") }

      before do
        sign_in user
        visit root_path
      end

      it { should have_link(p1.title, href: post_path(p1) ) }
      it { should have_content(p1.content) }
      it { should have_link('Edit', href: edit_post_path(p1) ) }
      it { should have_link('Delete', href: post_path(p1), method: :delete ) }

      it { should have_link(p2.title, href: post_path(p2) ) }
      it { should have_content(p2.content) }
      it { should have_link('Edit', href: edit_post_path(p2) ) }
      it { should have_link('Delete', href: post_path(p2), method: :delete ) }

      it "should have the posts in the right order" do
        page.body.index(p2.content).should < page.body.index(p1.content)
      end

    end
  end

  describe "About Page" do
    before { visit about_path }

    it { should have_selector('h2', text: "A Bit About Me") }
    it { should have_selector('title', text: "Corey Nagel - About Me") }
  end

  describe "Contact Page" do
    before  {visit contact_path}

    it { should have_selector('h2', text: "Hire Me") }
    it { should have_link("Corey Nagel", href: 'mailto:coreyelliotnagel@gmail.com') }

  end

end
