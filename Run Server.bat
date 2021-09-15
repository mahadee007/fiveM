@echo off
@title TEST Server1
%~dp0\FXServer +exec Server.cfg +set citizen_dir %~dp0\citizen\ %*
