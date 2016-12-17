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

  describe '#commented_by(user)' do
    describe 'when commented by a user' do
      it 'return true' do
        user = create(:user)
        letter = build(:letter)
        comment = create(:comment, letter: letter, user: user)
        expect(letter.commented_by(user)).to be_truthy
      end
    end
    describe 'when not commented by a user' do
      it 'return nil' do
        user = build(:user)
        another_user = build(:user)
        letter = build(:letter)
        comment = build(:comment, letter: letter, user: another_user)
        expect(letter.commented_by(user)).to be_falsey
      end
    end
  end

  describe '#created_in_24hours?' do
    context 'when created within 24 hours' do
      it 'return true' do
        letter = build(:letter, created_at: Time.now)
        expect(letter.created_in_24hours?).to be_truthy
      end
    end
    context 'when created after 24 hours' do
      it 'return false' do
        letter = build(:letter, created_at: Time.zone.yesterday)
        expect(letter.created_in_24hours?).to be_nil
      end
    end
  end

  describe '#created_time' do
    it 'return 2016年12月18日' do
      letter = build(:letter, created_at: 'Sun, 18 Dec 2016 12:34:56 UTC +00:00')
      expect(letter.created_time).to eq '2016年12月18日'
    end
  end

  describe '#best_seven_comments' do
    it 'returns 7 comments records' do
      letter = build(:letter)
      comment = build(:comment, letter: letter)
      expect(letter.best_seven_comments).to be_truthy
    end
  end

  describe '#create_letter' do
    it 'create a new letter' do
      letter = build(:letter)
      # set stub on letter.create_letter
      allow(letter).to receive(:create_letter).and_return(build(:letter))
      letter.create_letter
      expect(letter).to have_received(:create_letter)
    end
  end
end