$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "shopfinder_cms/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "shopfinder_cms"
  s.version     = ShopfinderCms::VERSION
  s.authors     = ["Alexander Penkin"]
  s.email       = ["apenkin78@gmail.com"]
  s.homepage    = "https://github.com/apenkin/shopfinder_cms"
  s.summary     = "Add news and articles functionality to application."
  s.description = "Add news and articles functionality to application. Ad admin part to manage news and articles. Active Admin is required."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '~> 3.2.13'
  s.add_dependency 'activeadmin', '~> 0.6.0'
  s.add_dependency 'mini_magick', '~> 3.4'
  s.add_dependency 'carrierwave', '~>0.8.0'
  s.add_dependency 'haml', '~>3.1.7'
  s.add_dependency 'RedCloth', '>=4.2.9'
  s.add_dependency 'kaminari', '>=0.13.0'
  s.add_dependency 'russian'
end
