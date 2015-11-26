class Movie < ActiveRecord::Base

  has_many :reviews

  validates :title, presence: true
  validates :director, presence: true
  validates :runtime_in_minutes, numericality: {only_integer: true}
  validates :description, presence: true
  validates :release_date, presence: true
  validate :release_date_is_in_the_past
  validate :must_have_image

  mount_uploader :image, ImageUploader

  def review_average
    if reviews.sum(:rating_out_of_ten) == 0
      "No reviews yet"
    else reviews.sum(:rating_out_of_ten)/reviews.size
    end
  end

  protected

  def release_date_is_in_the_past
    if release_date.present?
      errors.add(:release_date, "should be in the past") if release_date > Date.today
    end
  end

  def must_have_image
    if image.blank? && poster_image_url.blank?
      errors.add(:image, "Please add image either by URL or uploader")
    end
  end

end
