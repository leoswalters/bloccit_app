class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :user

  #default_scope { order('created_at DESC')}
  #default_scope { order('title ASC') }
  #scope :ordered_by_title, -> 'title ASC'
  #scope: ordered_by_title, -> { order('title ASC') }
  scope :ordered_by_title, -> {order(title: :asc)}
  #scope :ordered_by_title, -> { order ('title ASC') }

  #Order by reverse created_at
  scope :ordered_by_reverse_created_at, -> {order(created_at: :desc)}

end


