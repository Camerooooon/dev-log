LOGS_DIRECTORY="/home/cameron/Repos/dev-log/logs/"

TIME=$(date +%F-%H:%M)
echo Creating new entry for $TIME
cd $LOGS_DIRECTORY
touch $TIME.md
vim $TIME.md
git add $TIME.md
read -p "Commit and push to the internet?" -n 1 -r
if [[ ! $REPLY =~ ^[Nn]$ ]]
then
    exit 1
fi
git commit -m "New log $TIME"
git push origin main
