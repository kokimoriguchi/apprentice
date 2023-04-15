=begin
#パッケージ管理ツール
    ・世の中に公開されている gem を探し、1つ選択してください
        →faker
    ・その gem をインストールしてください
        →gem install fakerでインストールしました。
    ・インストールされている gem の一覧を表示してください
        →gem listで表示しました。
    ・今回インストールした gem をアンインストールしてください
        →
#パッケージの依存関係管理ツール
    ・Bundler が何のためにあるのか、プログラミング初心者にわかるように説明してください
        →gemという外部ライブラリがあり、これらは第三者が開発したもので開発の一助になる。
        これらにはバージョンがあり日々アップデートされておりバージョンの違いにより、動作の違いが発生し実際の本番環境でエラーが起こることがあります。
        そのgemのバージョンを管理してくれるのがBundlerです。
    ・Bundler を用いて、任意の gem を1つインストールしてください
        →bundle init でgemファイル作成し、gem 'faker'を記述。（バージョンはBundlerに任せた）その後、bundle install実行し動作確認済み。
=end
require 'faker'
require 'awesome_print'
puts Faker::VERSION
puts Faker::Name.name
ap ['Alice', 'Bob', 'Carol']