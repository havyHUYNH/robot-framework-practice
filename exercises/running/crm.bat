@echo off
cd C:\369_workspaces\02_Test_Framework\robot-framework\robot-framework-practice\crm
call robot -d results/batch/edge -v BROWSER:edge tests/crm.robot
