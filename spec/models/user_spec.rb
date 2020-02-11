require 'rails_helper'

RSpec.describe User, type: :model do
  
  let(:user1) { FactoryBot.create(:user) }
  let(:user2) { FactoryBot.create(:user) }
  let(:user3) { FactoryBot.create(:user) }
  
  let(:work1) { FactoryBot.create(:work_with_moves, user: user1) }
  let(:work2) { FactoryBot.create(:work_with_moves, user: user2) }
  let(:work3) { FactoryBot.create(:work_with_moves, user: user3) }
  
=begin
  it "work" do
    user1.works << FactoryBot.create(:work_with_moves)
    expect(user1.works.first.number_of_moves).to eq 3
  end
=end
  
  it "is valid" do
    expect(user1).to be_valid
  end
  
  it "is not valid" do
    user = User.new(name: "test", email: "abc")
    expect(user).not_to be_valid
  end
  
  describe 'Relationships methods' do
    let(:relationship) { Relationship.find_by(user_id: user1.id, follow_id: user2.id) }
    
    context 'まだフォローしていないとき' do
      describe '#follow' do
        it 'relationship exist' do
          user1.follow(user2)
          expect(relationship).not_to be nil
        end
      end
      
      describe '#unfollow' do
        it 'relationship not exist' do
          user1.unfollow(user2)
          expect(relationship).to be nil
        end
      end
      
      it '#following?' do
        expect(user1.following?(user2)).to be false
      end
    end
    
    context 'すでにフォローしているとき' do
      before do
        Relationship.create(user_id: user1.id, follow_id: user2.id)
      end
      
      describe '#follow' do
        it 'relationship exist' do
          user1.follow(user2)
          expect(relationship).not_to be nil
        end
      end
      
      describe '#unfollow' do
        it 'relationship not exist' do
          user1.unfollow(user2)
          expect(relationship).to be nil
        end
      end
      
      it '#following?' do
        expect(user1.following?(user2)).to be true
      end
      
      describe '#feed_works' do
        it 'only following users and my works' do
          expect(user1.feed_works).to contain_exactly(work1, work2)
        end
      end
    end
    
  end
  
  describe "Likes methods" do
    let(:like) { Like.find_by(user_id: user1.id, work_id: work1.id) }
    
    context 'まだいいねしていないとき' do
      describe '#like' do
        it 'like exist' do
          user1.like(work1)
          expect(like).not_to be nil
        end
      end
      
      describe '#unlike' do
        it 'like not exist' do
          user1.unlike(work1)
          expect(like).to be nil
        end
      end
      
      it '#like?' do
        expect(user1.like?(work1)).to be false
      end
    end
    
    context 'すでにいいねしているとき' do
      before do
        Like.create(user_id: user1.id, work_id: work1.id)
      end
      
      describe '#like' do
        it 'like exist' do
          user1.like(work1)
          expect(like).not_to be nil
        end
      end
      
      describe '#unlike' do
        it 'like not exist' do
          user1.unlike(work1)
          expect(like).to be nil
        end
      end
      
      it '#like?' do
        expect(user1.like?(work1)).to be true
      end
    end
  end
  
  describe 'statused methods' do
    
    #create/change/delete のテスト
    
    context 'work1:solved, work2:solve_later' do
      before do
        WorkStatus.create(user_id: user1.id, work_id: work1.id, status: 'solved')
        WorkStatus.create(user_id: user1.id, work_id: work2.id, status: 'solve_later')
      end
      describe '#solved_works' do
        it 'solved_works includes only work1' do
          expect(user1.solved_works).to contain_exactly(work1)
        end
      end
      describe '#solve_later_works' do
        it 'solve_later_works includes only work2' do
          expect(user1.solve_later_works).to contain_exactly(work2)
        end
      end
    end
  end
  
end
