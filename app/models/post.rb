class Post < ActiveRecord::Base
	belongs_to :user
	has_many 	 :comments
	validates :title, presence: true,
						length: { minimum: 3, maximum: 50}
	validates :description, presence: true,
						length: { minimum: 10, maximum: 1500 }
	mount_uploader :image, ImageUploader
	validate  :image_size

  private

    # Validates the size of an uploaded picture.
    def image_size
      if image.size > 5.megabytes
        errors.add(:image, "should be less than 5MB")
      end
    end
end
