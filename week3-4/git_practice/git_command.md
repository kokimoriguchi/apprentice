## ブランチ
- ブランチを切り替えながらコミットすると別のコミットとして生まれるので別作業を並行して行える。
- git checkout <既存ブランチ名>
- git checkout -b <新ブランチ名> → -b オプションつけるとブランチを新規作成して切り替える
- git branch → ブランチの確認
- git branch -d <ブランチ名> → ブランチの削除

## プルリクエスト
- git branchでmainにいることを確認し、git pull origin mainで最新の状態にする。git statsuで一応確認する。
- git checkout -b <新ブランチ名> → -b オプションつけるとブランチを新規作成して切り替える
- ファイルを変更する。
- git add <変更したファイル>してgit commit
- git push origin <新ブランチ名>
- GitHubに移動しプルリクエストの画面に行きcompareの部分のブランチをさっき作った方にする。そしてcreate pull requestする。レビュワーも選ぶ。
- コードレビューの人はfile Changedのところで諸々できる。送信するとプルリク送った人に届くのでこのやり取りを続ける。
- 終了したらgit merge origin/mainで統合する。（新しいブランチのまま）でgit add <変更したファイル>してgit commit。一応git statsuする。マージしてるから知らんの増えてるかも。git push origin <さっき作ったブランチ名>。gitに行くとマージプルリクエストと緑で出ているのでおして、ブランチ削除する。そしたらこの変更分をローカルにも反映させるためにgit checkout mainでブランチ変えて、git pull origin mainで取り込む。git branch -d <さっき作ったブランチ名>いらないから消す。