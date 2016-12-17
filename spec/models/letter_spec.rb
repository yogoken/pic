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
end