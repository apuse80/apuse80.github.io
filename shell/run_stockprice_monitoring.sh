#!/bin/bash

# to set path variables
export PYTHONPATH="/Users/donghankim/myGitCode/stockinvest/lib:$PYTHONPATH"
export CONFIGPATH="/Users/donghankim/myGitCode/stockinvest/config/.config.ini"
export CONFIGENV="/Users/donghankim/myGitCode/stockinvest/config/.config.env"

# move to the python script folder
cd /Users/donghankim/myGitCode/stockinvest

# 2. git pull
git pull 

# 3. 가상환경 활성화
source venv/bin/activate

# 4. Python 스크립트 실행
python /Users/donghankim/myGitCode/stockinvest/scripts/stockprice_monitering.py

# 5. (선택) 가상환경 비활성화
deactivate
