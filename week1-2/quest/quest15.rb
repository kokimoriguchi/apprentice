=begin
#debugによるデバッグ
・bundle init でgemファイル作成し、gem 'debug'を記述。（バージョンはbundlerに任せた）その後、bundle install実行でインストール完了。
・使用の際はrequire 'debug'を記述し処理を止めたい箇所にbinding.breakを記述すると止めることができる。
・ターミナルでruby .rbを実行したらp 引数で引数を見ることができる。nでその続きの処理に進む。詳しくはチェリー本p492
=end