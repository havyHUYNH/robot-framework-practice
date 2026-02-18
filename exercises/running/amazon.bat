@echo off
cd C:\369_workspaces\02_Test_Framework\robot-framework\robot-framework-practice\amazon_page_object

REM #All test cases execution
call robot -d results/batch/edge -v BROWSER:edge tests/amazon.robot

REM #single test case execution
REM call robot -d Results/single -t "Logged out user must sign in to check out" -v BROWSER:edge tests/amazon.robot 