# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ans-application_config/version'

Gem::Specification.new do |gem|
  gem.name          = "ans-application_config"
  gem.version       = Ans::ApplicationConfig::VERSION
  gem.authors       = ["sakai shunsuke"]
  gem.email         = ["sakai@ans-web.co.jp"]
  gem.description   = %q{アプリケーションの設定を locale ファイルから読み出す}
  gem.summary       = %q{アプリケーション設定}
  gem.homepage      = "https://github.com/answer/ans-application_config"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
