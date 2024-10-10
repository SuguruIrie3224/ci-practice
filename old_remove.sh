#!/bin/bash

# 設定
SOURCE_REPO_URL="https://github.com/SuguruIrie3224/ci-practice.git"
DEST_REPO_URL="https://github.com/SuguruIrie3224/ci-practice-archive.git"
TEMP_DIR="temp_repo"
CUTOFF_DATE=$(date -d "1 month ago" +%s)

# クローンし、最新の情報を取得
git clone --mirror $SOURCE_REPO_URL $TEMP_DIR
cd $TEMP_DIR
git fetch --prune

# 古いブランチをリストアップし、移行と削除を行う
for branch_info in $(git for-each-ref --format='%(committerdate:unix) %(refname:short)' refs/remotes/); do
    commit_date=$(echo $branch_info | cut -d' ' -f1)
    branch_name=$(echo $branch_info | cut -d' ' -f2 | sed 's/^origin\///')

    echo "Branch: $branch_name, Commit date: $commit_date"

    if [ $commit_date -lt $CUTOFF_DATE ]; then
        echo "Branch $branch_name is older than 1 month. Processing..."

        # ブランチを別のリポジトリに移行
        git checkout $branch_name
        git remote add dest-repo $DEST_REPO_URL
        git push dest-repo $branch_name

        # 元のリポジトリからブランチを削除
        git push origin --delete $branch_name
    fi
done

# クリーンアップ
cd ..
rm -rf $TEMP_DIR

echo "Cleanup completed."
