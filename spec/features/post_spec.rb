require 'rails_helper'

describe 'navigate' do
    before do
        @user = FactoryBot.create(:user)
        login_as(@user, :scope => :user)
    end

    describe 'index' do
        before do
            visit posts_path
        end
        it 'can be reached successfully' do
            expect(page.status_code).to eq(200)
        end

        it 'can has a title of Posts' do
            expect(page).to have_content(/Posts/)
        end

        it 'can has a lists of Posts' do
            post1 = FactoryBot.create(:post)
            post2 = FactoryBot.create(:second_post)
            visit posts_path

            expect(page).to have_content(/rationale|content/)
        end
    end

    describe 'new' do
        it 'has a link from a homepage' do
            visit root_path
            click_link 'new_post_from_nav'
            expect(page.status_code).to eq(200)
        end
    end

    describe 'delete' do
        it 'can be deleted' do
            post = FactoryBot.create(:post)
            visit posts_path

            click_button("delete_post_#{post.id}_from_index")
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
            fill_in 'post[date]', with: Date.today
            fill_in 'post[rationale]', with: "Some rationale"

            click_on "Save"
            expect(page).to have_content("Some rationale")
        end

        it 'will have a user associated it' do
            fill_in 'post[date]', with: Date.today
            fill_in 'post[rationale]', with: "User Association"

            click_on "Save"
            expect(User.last.posts.last.rationale).to have_content("User Association")
        end
    end

    describe 'edit' do
        before do
            @post = FactoryBot.create(:post)
        end
        it "can be reached by clicking edit on index page" do
            visit posts_path

            click_link "edit-#{@post.id}"
            expect(page.status_code).to eq(200)
        end

        it "can be edited" do
            visit edit_post_path(@post)

            fill_in 'post[date]', with: Date.today
            fill_in 'post[rationale]', with: "Edited content"

            click_on "Save"

            expect(page).to have_content("Edited content")
        end
    end
end












