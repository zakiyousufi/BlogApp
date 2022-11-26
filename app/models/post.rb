class Post < ApplicationRecord
  has_many :comment
  has_many :like
  belongs_to :author, class_name: 'User'
  after_save :update_posts_counter

  def return_recent_comments
    comment.order(created_at: :desc).limit(5)
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
