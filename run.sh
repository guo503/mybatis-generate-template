#!/usr/bin/env bash

file_list=`ls *generatorConfig* | cat -n`
echo "配置文件列表:"
echo "$file_list"
echo -n "请选择要执行的文件序号: "
read sequence
#判空
if [ -z "$sequence" ]; then
    echo "文件序号不能为空!"
	exit 1
fi
#保存选中文件
file_name=""
#先设置分隔符为换行符
IFS=$'\n'
for i in $file_list
	do
	      t_sequence=`echo $i | awk -F ' ' '{print $1}'`
		  if test $t_sequence == $sequence;then
		  	file_name=`echo $i | awk -F ' ' '{print $2}'`
		    break;
		  fi
	done

if [ -z "$file_name" ]; then
    echo "文件序号不存在!"
	exit 1
fi
echo ""
echo "------所选配置文件------: $file_name"
echo ""
#执行生成命令
echo "`java -jar mybatis-generator-1.0.0.jar -configfile $file_name -overwrite`"

exec /bin/bash

