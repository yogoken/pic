require 'rails_helper'

describe Comment do
  let(:user) { create(:user) }
  let(:letter) { create(:letter) }
  let(:comment) { create(:comment, user: user, letter: letter) }

  describe 'associations' do
    it 'is associated with user' do
      expect(comment.user).to eq user
    end
    it 'is associated with letter' do
      expect(comment.letter).to eq letter
    end
    describe 'with likes' do
      let(:likes_count){ 1 }
      let!(:comment) { create(:comment, :with_likes, likes_count: likes_count) }
      it 'deletes the likes when Comment is deleted' do
        expect{ comment.destroy }.to change(Like, :count).by(-1)
      end
    end
  end

  describe '#likes_by(user)' do
    describe 'when likes by a user' do
      it 'return likes array' do
        like = create(:like, comment: comment, user: user)
        expect(comment.likes_by(user)).to eq like
      end
    end
    describe 'when not likes by a user' do
      it 'return nil' do
        another_user = build(:user)
        comment = build(:comment, user: another_user, letter: letter)
        expect(comment.likes_by(user)).to eq nil
      end
    end
  end
end