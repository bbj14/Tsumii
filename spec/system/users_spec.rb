require 'rails_helper'

RSpec.describe 'Users', type: :system do
  
  let(:user1) { FactoryBot.create(:user) }
  let!(:user2) { FactoryBot.create(:user) }
  let!(:work1) { FactoryBot.create(:work_with_moves, user: user1, title: 'test_title1') }
  let!(:work2) { FactoryBot.create(:work_with_moves, user: user2, title: 'test_title2') }
  
  context 'user1がログインしたとき' do
    before do
      visit login_path
      fill_in 'メールアドレス', with: user1.email
      fill_in 'パスワード', with: user1.password
      click_button 'ログイン'
    end
    
    context 'ログイン後のページ（マイページ）' do
      it 'work1が表示される' do
        expect(page).to have_content 'test_title1'
      end
      
      it 'いいねajaxが動く' do
        likebtn = find(".btn-dark")
        likebtn.click
        expect(page).to have_selector '.btn-dark', text: '1'
      end
    end
    
    context 'トップページに移動' do
      before do
        visit root_path
      end
      
      it 'トップページで作品が2つとも表示される' do
        expect(page).to have_content 'test_title1'
        expect(page).to have_content 'test_title2'
      end
    end
    
    context 'user2ページに移動' do
      before do
        visit user_path(user2)
      end
      
      it 'work2が表示される' do
        expect(page).to have_content 'test_title2'
      end
      
      it 'フォローajaxが動く' do
        click_on 'フォローする'
        expect(page).to have_button 'フォロー中'
        expect(page).to have_selector '#follower-count', text: '1'
      end
      
      it 'フォローはずしajaxが動く' do
        click_on 'フォローする'
        click_on 'フォロー中'
        expect(page).to have_button 'フォローする'
        expect(page).to have_selector '#follower-count', text: '0'
      end
    end
  end
end