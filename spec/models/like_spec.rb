require 'rails_helper'

RSpec.describe Like, type: :model do
  @user = User.create(
    name: 'Doe', photo: 'https://johndoe.com/me.png',
    bio: 'I am John Doe.', posts_counter: 0
  )

  post = Post.create(
    author: @user, title: 'About', text: 'About me', comments_counter: 0,
    likes_counter: 0
  )

  Like.create(post:, author: @user)

  context 'update_likes_counter' do
    it ' increment likes_counter' do
      expect(Post.find(post.id).likes_counter).eql?(post.likes_counter + 1)
    end
  end
end
