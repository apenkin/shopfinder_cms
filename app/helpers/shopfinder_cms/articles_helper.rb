module ShopfinderCms
  module ArticlesHelper
    def parse_text(res)
      _text = res.text
      _text.gsub!("{{IMAGE}}", image_tag(res.image.url(:large))) if res.image.present?
      _text.gsub!("{{IMAGE2}}", image_tag(res.image2.url(:large))) if res.image2.present?
       RedCloth.new(_text).to_html.html_safe
    end
  end
end
