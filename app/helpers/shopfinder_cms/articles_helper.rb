module ShopfinderCms
  module ArticlesHelper
    def parse_text(text)
       RedCloth.new(text).to_html.html_safe
    end

    def parse_article_text(res, use_images = true, length = nil)
      _text = res.text
      if use_images
        _text.gsub!("{{IMAGE}}", image_tag(res.image.url(:large), :title => res.title)) if res.image.present?
        _text.gsub!("{{IMAGE2}}", image_tag(res.image2.url(:large), :title => res.title)) if res.image2.present?
      else
        _text.gsub!("{{IMAGE}}", '')
        _text.gsub!("{{IMAGE2}}", '')
      end
      _text = truncate(_text, length: length) if length
      RedCloth.new(_text).to_html.html_safe
    end

    def parse_item_text(res, use_images = true, length = nil)
      _text = res.text
      if use_images
        _text.gsub!("{{IMAGE}}", image_tag(res.image.url(:large), :title => res.title)) if res.image.present?
      else
        _text.gsub!("{{IMAGE}}", '')
      end
      _text = truncate(_text, length: length) if length
      RedCloth.new(_text).to_html.html_safe
    end
  end
end
