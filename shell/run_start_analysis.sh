#!/bin/bash

echo "running run_start_analysis.sh"

# to set path variables
export PYTHONPATH="/Users/donghankim/myGitCode/stockinvest/lib:$PYTHONPATH"
export CONFIGPATH="/Users/donghankim/myGitCode/stockinvest/config/.config.ini"
export CONFIGENV="/Users/donghankim/myGitCode/stockinvest/config/.config.env"

echo "git setting..."
# git setting
git remote set-url origin git@github.com:apuse80/stockinvest.git
git remote set-url origin git@github.com:apuse80/apuse80.github.io.git

# repo:apuse80.github.io.git pull
echo "pull repo of apuse80.github.io.git"
cd /Users/donghankim/myGitCode/apuse80.github.io.git

if git pull; then 
    echo "pulling is successful..."
else
    echo "pulling is failed... trying in other way..."
    git fetch origin
    git reset --hard origin/main
fi 

# move to the python script folder
cd /Users/donghankim/myGitCode/stockinvest

# repo:stockinvest pull
echo "pull repo of stockinvest"
git pull 

# 3. 가상환경 활성화
source venv/bin/activate

# 4. Python 스크립트 실행
echo "running start_analysis.py"
python /Users/donghankim/myGitCode/stockinvest/scripts/start_analysis.py

# 5. (선택) 가상환경 비활성화
deactivate

git add .
git commit -m "update automatically generated analysis result from supernova"
git push