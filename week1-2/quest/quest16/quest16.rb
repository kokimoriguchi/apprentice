=begin
静的解析ツールを使うことができる
  #1コーディング規約
    ・コーディング規約とは、エンジニアが複数人で同一のタスクやプロジェクトを行う際にソースコードについて定めたルールのことです。
    ・プログラムがどのように作られるべきかを示し、品質を保つために作成されます。
    ・各言語ごとに有名なコーディング規約が存在しています。
    ・Ruby のコーディング規約について調べ、どのようなルールが一般的に規定されているか、目を通してみてください。
  #2静的解析ツール
    ・gemファイルに、
      group :development do
        gem 'rubocop', require: false
        gem "rubocop-performance", require: false
        gem "rubocop-rails", require: false
        gem "rubocop-rspec", require: false
      end
      を記入する。そしてbundle installする。その後、bundle exec rubocop --auto-gen-configを行うことで、
      .rubocop.ymlと.rubocop_todo.ymlが作成される。これで準備は完了です。
    ・bundle exec rubocopを実行すれば今いるディレクトリ以降の全てのファイルを確認しルールに沿っているのか確認してくれる。
=end