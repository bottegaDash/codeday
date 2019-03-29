require 'rails_helper'

describe 'navigate' do
  let(:user) { FactoryBot.create(:user) }

  let(:post) do
    Post.create(information: "Some information", user_id: user.id)
  end

  before do
    login_as(user, :scope => :user)
  end

  describe 'index' do
    before do
      visit posts_path
    end
    it 'can be reached successfully' do
      expect(page.status_code).to eq(200)
    end

    it 'it has a title of Posts' do
      expect(page).to have_content(/Posts/)
    end

    it 'has a scope so that only post creators can see their posts' do
      other_user = User.create(email: 'nonauth@example.com',
                               password: 'asdfasdf', password_confirmation: 'asdfasdf')
      post_from_other_user = Post.create(information: "This post shouldn't be seen", user_id: other_user.id)
      visit posts_path

      expect(page).to_not have_content(/This post shouldn't be seen/)
    end
  end

  describe 'new' do
    it 'has a link from the postpage ' do
      user = User.create(email: 'employee@example.com',
                         password: 'asdfasdf', password_confirmation: 'asdfasdf')
      login_as(user, :scope => :user)
      visit posts_path

      click_link("New_Post")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'delete' do
    it 'can be deleted' do
      logout(:user)
      delete_user = FactoryBot.create(:user)
      login_as(delete_user, :scope => :user)

      post_to_delete = Post.create(information: 'asdf', user_id: delete_user.id)
      visit posts_path

      click_link("Destroy#{post_to_delete.id}")
      expect(page.status_code).to eq(200)
    end
  end

  describe 'creation' do
    before do
      visit new_post_path
    end
    it 'has a new form that can be reached' do
      expect(page.status_code).to eq(200)
    end

    it 'can be created from new form page' do
      fill_in 'post[information]', with: 'Some rationale'

      expect { click_on "Create Post" }.to change(Post, :count).by(1)
    end

    it 'will have a user associated it' do
      fill_in 'post[information]', with: "User Association"
      click_on "Create Post"

      expect(User.last.posts.last.information).to eq("User Association")
    end
  end

  describe 'edit' do
    it 'can be edited' do
      visit edit_post_path(post)
      fill_in 'post[information]', with: "Eddited information"
      click_on "Update Post"

      expect(User.last.posts.last.information).to eq("Eddited information")

    end
  end
end
