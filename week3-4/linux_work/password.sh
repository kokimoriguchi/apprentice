#!/bin/bash
PASSWORD_FILE="passwords.txt"
echo "パスワードマネージャーへようこそ！"
echo "サービス名を入力してください："
read SERVICE_NAME

echo "ユーザー名を入力してください："
read USER_NAME

echo "パスワードを入力してください："
read PASSWORD
echo "${SERVICE_NAME}:${USER_NAME}:${PASSWORD}" >> "${PASSWORD_FILE}"
echo "Thank you!"
