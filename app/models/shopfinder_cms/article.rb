module ShopfinderCms
  class Article < ActiveRecord::Base
    attr_accessible :document_type, :document_id, :title, :text, :short_text, :author, :published_at, :image, :image2
    attr_accessible :meta_title, :meta_keywords, :meta_description, :slug, :document_name

    attr_accessor :document_name

    belongs_to :document, :polymorphic => true

    validates :title, :text, :presence => true
    mount_uploader :image,  ShopfinderCms::ImageUploader
    mount_uploader :image2,  ShopfinderCms::ImageUploader
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
