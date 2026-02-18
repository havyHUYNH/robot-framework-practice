@echo off
cd C:\369_workspaces\02_Test_Framework\robot-framework\robot-framework-practice\amazon
call robot -d results/batch/edge -v BROWSER:edge tests/amazon.robot
