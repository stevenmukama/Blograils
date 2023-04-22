require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:user) { User.create(name: 'Steven', bio: 'coder', posts_counter: 0) }
  let!(:post) do
    Post.create(title: 'software developer', text: 'debugging', author: user, likes_counter: 0, comments_counter: 0)
  end
  subject { described_class.create(text: 'debugging', post:, author: user) }

  describe 'associations' do
    it 'should belong to correct user' do
      expect(subject.author).to eql user
    end

    it 'should belong to correct post' do
      expect(subject.post).to eql post
    end

    it 'should update counter of related post' do
      expect(subject.post.comments_counter).to eql 1
    end
  end
end
