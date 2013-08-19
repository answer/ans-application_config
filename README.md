# Ans::ApplicationConfig

locale からアプリケーションの設定を読み込む

つまり config/locales/app.yml とかにアプリケーションの設定を書いた yml を置いておき、
アプリケーションからこの内容をアプリケーション設定として読み込む

## Installation

Add this line to your application's Gemfile:

    gem 'ans-application_config'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ans-application_config

## Usage

    # config/locales/my_app.yml
    ja:
      my_app:
        domain: "domain.com"
        image:
          some_url: "url"

    # config/application.rb
    module MyApp
      include Ans::ApplicationConfig

      ...
    end

    # somewhere
    MyApp.config.domain
    MyApp.config.image.some_url
    MyApp.config["domain"]
    MyApp.config["image.some_url"]

デフォルトの yml のルートスコープはアプリケーションモジュール名を underscore したもの


## 可能な設定とデフォルト

    # config/initializers/ans-application_config.rb
    Ans::ApplicationConfig.configure do |config|
      # 設定として認識するルートスコープ
      config.root_scope = アプリケーションモジュール.underscore
    end


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
