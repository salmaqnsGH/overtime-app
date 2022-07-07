require 'rails_helper'

describe 'navigate' do
    before do
        @admin_user = FactoryBot.create(:admin_user)
        login_as(@admin_user, :scope => :admin_user)
    end
    
    # describe 'edit' do
    #     before do
    #         @post = FactoryBot.create(:post)
    #     end
    #     it 'has a status that can be editted in form' do
    #         visit edit_post_path(@post)
    #         # find(:css, "post_status_approved").set(true)
    #         choose('post_status_approved', visible: false )
    #         # check('post_status_approved')
    #         click_on "Save"
    #         p "#{@post.inspect} + <======="
    #         p "#{@post.status} + <======="
    #         expect(@post.reload.status).to eq('approved')
    #     end
    # end
end












