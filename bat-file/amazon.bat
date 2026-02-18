@echo off
cd C:\369_workspaces\02_Test_Framework\robot-framework\robot-framework-practice\amazon
call robot -d results/batch/edge -v BROWSER:edge tests/amazon.robot
REM call robot -d Results/single -t "User can view a product" -v BROWSER:edge tests/amazon.robot