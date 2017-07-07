class Micropost < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true,
    length: {maximum: Settings.Micropost.validate.content}
  validate :picture_size

  scope :order_created, ->{order created_at: :desc}
  scope :feed_id, ->id do
    where "user_id IN (SELECT followed_id FROM relationships
      WHERE follower_id = :id) OR user_id = :id", id: id
  end

  mount_uploader :picture, PictureUploader

  delegate :name, to: :user

  private

  def picture_size
    return if picture.size < Settings.Micropost.picture_size.megabytes
    errors.add :picture, I18n.t("image_size")
  end
end
