require 'spec_helper'

describe "UserPages" do

  subject { page }

  describe "All Posts Page" do
    let(:user) { FactoryGirl.create(:user) }
    let!(:p1) { FactoryGirl.create(:post, user: user)}
    let!(:p2) { FactoryGirl.create(:post, user: user)}

    before { visit user_path(user) }

    it { should have_selector('h2', text: user.name) }
    it { should have_selector('title', text: user.name) }

    describe "microposts" do
      it { should have_content(p1.title) }
      it { should have_content(p2.title) }
      it { should have_content(user.posts.count) }
    end
  end

end
