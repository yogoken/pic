require 'rails_helper'

describe Letter do
  let(:user) { create(:user) }
  let(:letter) { create(:letter) }
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

  describe '#comments_by(user)' do
    before do
      user
      letter
    end
    describe 'when commented by a user' do
      it 'return true' do
        comment = create(:comment, letter: letter, user: user)
        expect(letter.comments_by(user)).to eq comment
      end
    end
    describe 'when not commented by a user' do
      it 'return nil' do
        expect(letter.comments_by(user)).to eq nil
      end
    end
  end

  describe '#created_in_24hours?' do
    let(:letter) { build(:letter, created_at: created_at) }
    subject { letter.created_in_24hours? }
    context 'when created within 24 hours' do
      let(:created_at) { Time.now }
      it 'return true' do
        is_expected.to be_truthy
      end
    end
    context 'when created after 24 hours' do
      let(:created_at) { Time.zone.yesterday }
      it 'return false' do
        is_expected.to be_nil
      end
    end
  end

  describe '#created_time_with_format' do
    it 'return 2016年12月18日' do
      letter = build(:letter, created_at: 'Sun, 18 Dec 2016 12:34:56 UTC +00:00')
      expect(letter.created_time_with_format).to eq '2016年12月18日'
    end
  end

  describe '#best_seven_comments' do
    it 'returns 7 comments records' do
      letter = create(:letter, :with_seven_comments, comments_count: 7)
      expect(letter.best_seven_comments.count).to eq 7
    end
  end

  describe '#create_letter' do
    it 'receive create_letter method' do
      allow(letter).to receive(:create_letter).and_return(build(:letter))
      letter.create_letter
      expect(letter).to have_received(:create_letter)
    end
  end
end
