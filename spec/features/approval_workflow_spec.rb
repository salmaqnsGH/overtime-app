require 'rails_helper'

describe 'navigate' do
    before do
        @admin_user = FactoryBot.create(:admin_user)
        login_as(@admin_user, :scope => :admin_user)
    end
    
    describe 'edit' do
        before do
            @post = FactoryBot.create(:post)
            visit edit_post_path(@post)
        end
    #     it 'has a status that can be editted in form by an admin' do
    #         # find(:css, "post_status_approved").set(true)
    #         choose('post_status_approved', visible: false )
    #         # check('post_status_approved')
    #         click_on "Save"
    #         p "#{@post.inspect} + <======="
    #         p "#{@post.status} + <======="
    #         expect(@post.reload.status).to eq('approved')
    #     end

        it "cannot be editted by a non admin" do
            logout(:user)
            @user = FactoryBot.create(:user)
            login_as(@user, :scope => :user)
            visit edit_post_path(@post)

            expect(page).to_not have_content("Approved")
        end
    end

end












