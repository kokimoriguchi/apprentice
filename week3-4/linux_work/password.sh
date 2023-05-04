#!/bin/bash
# パスワードを保存するファイルのパス
PASSWORD_FILE="./passwords.txt"

# パスワードマネージャーのメニューを表示する関数
show_menu() {
  echo "パスワードマネージャーへようこそ！"
  echo "次の選択肢から入力してください(Add Password/Get Password/Exit):"
}

# パスワードを追加する関数
add_password() {
  echo "サービス名を入力してください："
  read service
  echo "ユーザー名を入力してください："
  read username
  echo "パスワードを入力してください："
  read password

  # パスワードをファイルに追記する
  echo "$service,$username,$password" >> $PASSWORD_FILE

  echo "パスワードの追加は成功しました。"
}

# パスワードを取得する関数
get_password() {
  echo "サービス名を入力してください："
  read service

  # ファイルから該当するサービス名の行を検索する
  password_line=$(grep "^$service," $PASSWORD_FILE)

  if [ -z "$password_line" ]; then
    echo "そのサービスは登録されていません。"
  else
    # サービス名、ユーザー名、パスワードをカンマ区切りで取得する
    IFS=',' read -r service_name username password <<< "$password_line"
    echo "サービス名：$service_name"
    echo "ユーザー名：$username"
    echo "パスワード：$password"
  fi
}

# パスワードマネージャーのメニューを表示する
show_menu

# ユーザーの選択に応じて処理を実行する
while true; do
  read choice

  case $choice in
    "Add Password")
      add_password
      show_menu
      ;;
    "Get Password")
      get_password
      show_menu
      ;;
    "Exit")
      echo "Thank you!"
      exit 0
      ;;
    *)
      echo "入力が間違えています。Add Password/Get Password/Exit から入力してください。"
      show_menu
      ;;
  esac
done
