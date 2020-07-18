@echo off
set/p model=请输入要生成的文件名：
if "%model%" =="" echo 文件名不能为空！
%jar包位置多个用&连接%
java -jar mybatis-generator-1.0.0.jar -configfile "%model%" -overwrite  
pause     %防止执行完后闪过%         