module ShopfinderCms
  class Item < ActiveRecord::Base
    attr_accessible :title, :text, :published_at, :image
    attr_accessible :meta_title, :meta_keywords, :meta_description, :slug

    mount_uploader :image,  ShopfinderCms::ImageUploader

    belongs_to :document, :polymorphic => true
    validates :title, :text, :presence => true
    scope :published, where('published_at is not null')

    after_create :generate_slug!

    def to_param
      self.slug
    end

    protected
    def generate_slug!
      self.slug = "#{Russian::transliterate(self.title).parameterize}-#{self.id}"
      self.save
    end
  end
end
