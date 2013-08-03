#/bin/bash

#################################
# 1. 数组下标只能为数字
# 2. 数组下标只能为数字
# 3. 数组下标只能为数字
#################################

#######################
# 数组声明
#

#1 array[key]=value
ARR1[0]=one
ARR1[0]=two

echo ${ARR1[0]}
echo ${#ARR1}
typeset -p ARR1
echo "------\n"

#2 declare -a array
declare -a ARR2='([0]="v1" [1]="v2" [2]="v3")'

echo ${ARR2[0]}
echo ${#ARR2}
typeset -p ARR2
echo "------\n"


#3 
#3.1 array=( val1 val2 val3 )


ARR3_1=( v1 v2 v3 )

echo ${ARR3_1[0]}
echo ${#ARR3_1}
typeset -p ARR3_1
echo "------\n"


#3.2 array= ([key1]=val1 [key2]=val2)

ARR3_2=([0]=val1 [1]=val2 [2]=val3)

echo ${ARR3_2[0]}
echo ${#ARR3_2}
typeset -p ARR3_2
echo "------\n"

#4 array="val1 val2 val3" ### 注，这个在mac下是会有问题的。仍然是当做一个字符串
ARR4="val1 val2 val3"

echo ${ARR4[0]}
echo ${#ARR4}
typeset -p ARR4
echo "------\n"

#数组下标只能为数字，这里举例一个错误的
ARR_ERR=([0]=kkxx [kk]=kkval1 [1]=val2 [2]=val3)
echo ${ARR_ERR[kk]}
echo ${#ARR_ERR}
typeset -p ARR_ERR
echo "------\n"

#######################



#######################
# 数组访问
#
G_ARR=( val0test_zero_f val1_one_m val2_two_fff val3_three_s val4_four_efef val5_five_fdfff val6_six_lffvffssffffffffffffffff)

#1 ${array[key]} #访问数组中某个值
echo ${G_ARR[0]}

echo "--------\n"
#2 ${#array[*]} 或 ${#array[@]} #数组的长度
echo ${G_ARR[@]} 

echo ${#G_ARR[@]}
echo ${#G_ARR[*]}
echo "--------\n"
#3 ${#array[key]}  #数组单个元素的长度 注 第一个元素 ${#array[0]} 或 ${#array} 都可以取得
echo "item length"
echo ${G_ARR[@]} 

echo ${#G_ARR}
echo ${#G_ARR[0]}

echo ${#G_ARR[1]}
echo "--------\n"

#4 数组元素提取
#4.1 ${array[@]:key} 、${array[*]:key} #key>=0;提取从key索引为开始到最后的所有元素

echo ${G_ARR[@]}
echo ${G_ARR[@]:0}
echo ${G_ARR[@]:1}
echo ${G_ARR[@]:3}

echo ${G_ARR[*]:2}
echo "--------\n"
#4.2 ${array[@]:key:num} 、${array[*]:key:num} #key>=0,num>=0;提取从key索引开始num个元素

echo ${G_ARR[@]}

echo ${G_ARR[@]:0:${#G_ARR[@]}}
echo ${G_ARR[@]:0:2}
echo ${G_ARR[@]:1:3}
echo ${G_ARR[@]:3:5}
echo ${G_ARR[@]:1:2}
echo ${G_ARR[*]:2:3}
echo "--------\n"

#5 从左端删除mode匹配的部分 (#:最短 ##:最长） key可以为(@/*:所有元素 数字:索引为key的元素)  mode中可以有(*:匹配多个 ?:匹配单个)
#${array[*]#mode} ${array[*]##mode} 
#${array[@]#mode} ${array[@]##mode} 
#${array[key]#mode} ${array[key]##mode}
echo "# mode"
echo ${G_ARR[@]}
echo ${G_ARR[@]#v*l}
echo ${G_ARR[0]#v*l}
echo ${G_ARR[6]} "---->" ${G_ARR[6]#v*v}
echo ${G_ARR[6]} "---->" ${G_ARR[6]##v*v}
echo ${G_ARR[6]} "---->" ${G_ARR[6]##??}
echo "--------\n"
#6 从右端删除mode匹配的部分 (%:最短 %%:最长）key可以可以为(@/*:所有元素 数字:索引为key的元素)  mode中可以有(*:匹配多个 ?:匹配单个)
#${array[*]%mode} ${array[*]%%mode} 
#${array[@]%mode} ${array[@]%%mode} 
#${array[key]%mode} ${array[key]%%mode}
echo "% mode"
echo ${G_ARR[@]}
echo ${G_ARR[@]%v*f}
echo ${G_ARR[0]%v*f}

echo ${G_ARR[6]} "---->" ${G_ARR[6]%s*f}
echo ${G_ARR[6]} "---->" ${G_ARR[6]%%s*f}

echo ${G_ARR[6]} "---->" ${G_ARR[6]%%??}
echo "--------\n"


#7 替换  (/:第一个 //:全部 /#:前端子串 /%:后端字串)

# ${array[key]/search}
# ${array[key]//search}
# ${array[key]/search/replace}
# ${array[key]/search/replace}
# ${array[key]//search/replace}
# ${array[key]//search/replace}

# ${array[key]/#search}
# ${array[key]/#search/replace}

# ${array[key]/%search}
# ${array[key]/%search/replace}

echo ${G_ARR[6]} "---->" ${G_ARR[6]/six}
echo ${G_ARR[6]} "---->" ${G_ARR[6]/s*f/V}

echo ${G_ARR[6]} "---->" ${G_ARR[6]/s/V}
echo ${G_ARR[6]} "---->" ${G_ARR[6]//s/V}

echo ${G_ARR[6]} "---->" ${G_ARR[6]/ff/V}
echo ${G_ARR[6]} "---->" ${G_ARR[6]//ff/V}

echo ${G_ARR[6]} "---->" ${G_ARR[6]/#va*x/V}
echo ${G_ARR[6]} "---->" ${G_ARR[6]/%ff/V}


#######################
# 数组删除
#

ARR_D=(val1 val2 val3 val4)

#1 unset array[key]  #删除单个

typeset -a ${ARR_D}
echo ${ARR_D[@]}
echo ${ARR_D[1]}

unset ARR_D[1]

typeset -a ${ARR_D}
echo ${ARR_D[@]}
echo ${ARR_D[1]}

echo "------\n"

#2 unset array #删除整个

typeset -a ${ARR_D}
echo ${ARR_D[@]}

unset ARR_D

echo ${#ARR_D}
echo "------\n"
