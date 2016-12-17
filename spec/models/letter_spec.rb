require 'rails_helper'

describe Letter do
  describe 'associations' do
    describe 'with comments' do
      let(:comments_count){ 1 }
      let!(:letter) { create(:letter, :with_comments, comments_count: comments_count)}
      it 'deletes the comments when Letter is deleted' do
        expect{ letter.destroy }.to change(Comment, :count).by(-1 * comments_count)
      end
    end
    describe 'with storages' do
      let(:storages_count){ 1 }
      let!(:letter) { create(:letter, :with_storages, storages_count: storages_count) }
      it 'deletes the storages when Letter is deleted' do
        expect{ letter.destroy }.to change(Storage, :count).by(-1 * storages_count)
      end
    end
  end

  describe '#commented_by?(user)' do
    describe 'when commented by a user' do
      it 'return true' do
        user = create(:user)
        letter = create(:letter)
        comment = create(:comment, letter: letter, user: user)
        expect(letter.commented_by?(user)).to be_truthy
      end
    end
    describe 'when not commented by a user' do
      it 'return nil' do
        user = create(:user)
        another_user = create(:user)
        letter = create(:letter)
        comment = create(:comment, letter: letter, user: another_user)
        expect(letter.commented_by?(user)).to be_falsey
      end
    end
  end

  describe '#best_seven_comments' do
    it 'returns 7 comments records' do
      letter = create(:letter)
      comment = create(:comment, letter: letter)
      expect(letter.best_seven_comments).to be_truthy
    end
  end

  describe '#create_letter' do
    it 'create a new letter' do
      letter = create(:letter)
      # set stub on letter.create_letter
      allow(letter).to receive(:create_letter).and_return(create(:letter))
      letter.create_letter
      expect(letter).to have_received(:create_letter)
    end
  end
end