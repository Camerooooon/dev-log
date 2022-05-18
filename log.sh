LOGS_DIRECTORY="/home/cameron/Repos/dev-log/logs/"
DATE=$(date +%F)
TIME=$(date +%F-%H:%M)

echo Creating new entry for $TIME

cd $LOGS_DIRECTORY
touch $DATE.md

echo $(expr "$(cat count)" + 1) > count
COUNT="$(cat count)"

echo "Log #$COUNT | $TIME | " >> $DATE.md
nvim "+normal G$" +startinsert $DATE.md

read -p "Commit and push to the internet?" -n 1 -r
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

git add $DATE.md
git commit -m "New log $DATE.md #$COUNT"
git push origin main
