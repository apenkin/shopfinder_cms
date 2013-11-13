class CreateShopfinderCmsArticles < ActiveRecord::Migration
  def change
    create_table :shopfinder_cms_articles do |t|
      t.string   :document_type
      t.integer  :document_id

      t.string   :title
      t.text     :text
      t.text     :short_text
      t.string   :author
      t.datetime :published_at

      t.string   :image, :limit => 1000
      t.string   :image2, :limit => 1000

      t.string :meta_title
      t.text   :meta_keywords
      t.text   :meta_description

      t.string :slug

      t.timestamps
    end
  end
end
