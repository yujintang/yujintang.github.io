---
title: PostgreSQL字符串操作
date: 2016-09-13 14:34:47
tags: PostgreSQL
---

# 常用的逻辑操作符号
1. and ,or,not ,其语意与其它编程语言操作符相同

# 比较操作符
| 操作符号 |  描述   |
| :--: | :---: |
|  <   |  小于   |
|  >   |  大于   |
|  <=  | 小于或等于 |
|  >=  | 大于或等于 |
|  =   |  等于   |
|  !=  |  不等于  |
1.  a BETWEEN x AND y 等效于 a >= x AND a <= y    
2.  a NOT BETWEEN x AND y 等效于 a < x OR a > y
# 数学函数和操作符
## 基本操作符

| 操作符  | 描述    | 例子        | 结果         |
| ---- | ----- | --------- | ---------- |
| +    | 加     | 2 + 3     | 5          |
| -    | 减     | 2 - 3     | -1         |
| *    | 乘     | 2 * 3     | 6          |
| /    | 除     | 4 / 2     | 2          |
| %    | 模     | 5 % 4     | 1          |
| ^    | 幂     | 2.0 ^ 3.0 | 8          |
| \|/  | 平方根   | \|/ 25.0  | 5          |
| \|   | /     | 立方根       | \|\|/ 27.0 |
| !    | 阶乘    | 5 !       | 120        |
| !!   | 阶乘    | !! 5      | 120        |
| @    | 绝对值   | @ -5.0    | 5          |
| &    | 按位AND | 91 & 15   | 11         |
| \|   | 按位OR  | 32 \| 3   | 35         |
| \#   | 按位XOR | 17 # 5    | 20         |
| ~    | 按位NOT | ~1        | -2         |
| <<   | 按位左移  | 1 << 4    | 16         |
| >>   | 按位右移  | 8 >> 2    | 2          |
##  基本函数表

|             函数              |  返回类型   |       描述       |       例子        |        结果         |
| :-------------------------: | :-----: | :------------: | :-------------: | :---------------: |
|           abs(x)            |         |      绝对值       |   abs(-17.4)    |       17.4        |
|        cbrt(double)         |         |      立方根       |   cbrt(27.0)    |         3         |
|    ceil(double/numeric)     |         |  不小于参数的最小的整数   |   ceil(-42.8)   |        -42        |
|       degrees(double)       |         |    把弧度转为角度     |  degrees(0.5)   | 28.6478897565412  |
|     exp(double/numeric)     |         |      自然指数      |    exp(1.0)     | 2.71828182845905  |
|    floor(double/numeric)    |         |   不大于参数的最大整数   |  floor(-42.8)   |        -43        |
|     ln(double/numeric)      |         |      自然对数      |     ln(2.0)     | 0.693147180559945 |
|     log(double/numeric)     |         |    10为底的对数     |   log(100.0)    |         2         |
|  log(b numeric,x numeric)   |         | numeric指定底数的对数 | log(2.0, 64.0)  |   6.0000000000    |
|          mod(y, x)          |         |      取余数       |    mod(9,4)     |         1         |
|         pi() double         |         |     "π"常量      |      pi()       | 3.14159265358979  |
|  power(a double, b double)  | double  |     求a的b次幂     | power(9.0, 3.0) |        729        |
| power(a numeric, b numeric) | numeric |     求a的b次幂     | power(9.0, 3.0) |        729        |
|       radians(double)       | double  |    把角度转为弧度     |  radians(45.0)  | 0.785398163397448 |
|          random()           | double  | 0.0到1.0之间的随机数值 |    random()     |                   |
|    round(double/numeric)    |         |   圆整为最接近的整数    |   round(42.4)   |        42         |
|   round(v numeric, s int)   | numeric |   圆整为s位小数数字    | round(42.438,2) |       42.44       |
|    sqrt(double/numeric)     |         |      平方根       |    sqrt(2.0)    |  1.4142135623731  |

## 三角函数列表

|     函数      |     描述      |
| :---------: | :---------: |
|   acos(x)   |     反余弦     |
|   asin(x)   |     反正弦     |
|   atan(x)   |     反正切     |
| atan2(x, y) | 正切 y/x 的反函数 |
|   cos(x)    |     余弦      |
|   cot(x)    |     余切      |
|   sin(x)    |     正弦      |
|   tan(x)    |     正切      |

# 字符串函数和操作符
|                    函数                    | 返回类型 |                    描述                    |                    例子                    |                    结果                    |
| :--------------------------------------: | :--: | :--------------------------------------: | :--------------------------------------: | :--------------------------------------: |
|            string \|\| string            | text |                   字串连接                   |           'Post' \|\| 'greSQL'           |                PostgreSQL                |
|            bit_length(string)            | int  |                字串里二进制位的个数                |            bit_length('jose')            |                    32                    |
|           char_length(string)            | int  |                 字串中的字符个数                 |           char_length('jose')            |                    4                     |
|  convert(string using conversion_name)   | text |              使用指定的转换名字改变编码。              |                                          | convert('PostgreSQL' using iso_8859_1_to_utf8) |
|              lower(string)               | text |                 把字串转化为小写                 |               lower('TOM')               |                   tom                    |
|           octet_length(string)           | int  |                 字串中的字节数                  |           octet_length('jose')           |                    4                     |
|           octet_length(string)           | int  |                 字串中的字节数                  |           octet_length('jose')           |                    4                     |
| overlay(string placing string from int [for int]) | text |                  替换子字串                   | overlay('Txxxxas' placing 'hom' from 2 for 4) |                  Thomas                  |
|      position(substring in string)       | int  |                指定的子字串的位置                 |        position('om' in 'Thomas')        |                    3                     |
|  substring(string [from int] [for int])  | text |                  抽取子字串                   |     substring('Thomas' from 2 for 3)     |                   hom                    |
|      substring(string from pattern)      | text |           抽取匹配 POSIX 正则表达式的子字串           |     substring('Thomas' from '...$')      |                   mas                    |
| substring(string from pattern for escape) | text |             抽取匹配SQL正则表达式的子字串             | substring('Thomas' from '%#"o_a#"_' for '#') |                   oma                    |
| trim(\[leading \| trailing \| both\] [characters] from string) | text | 从字串string的开头/结尾/两边/ 删除只包含characters(缺省是一个空白)的最长的字串 |       trim(both 'x' from 'xTomxx')       |                   Tom                    |
|              upper(string)               | text |                把字串转化为大写。                 |               upper('tom')               |                   TOM                    |
|               ascii(text)                | int  |              参数第一个字符的ASCII码              |                ascii('x')                |                   120                    |
|  btrim(string text [, characters text])  | text | 从string开头和结尾删除只包含在characters里(缺省是空白)的字符的最长字串 |         btrim('xyxtrimyyx','xy')         |                   trim                   |
|                 chr(int)                 | text |               给出ASCII码的字符                |                chr(65)	A                 |                                          |
| convert(string text, [src_encoding name,] dest_encoding name) | text |           把字串转换为dest_encoding            | convert( 'text_in_utf8', 'UTF8', 'LATIN1') |       以ISO 8859-1编码表示的text_in_utf8       |
|              initcap(text)               | text | 把每个单词的第一个子母转为大写，其它的保留小写。单词是一系列字母数字组成的字符，用非字母数字分隔。 |           initcap('hi thomas')           |                Hi Thomas                 |
|           length(string text)            | int  |               string中字符的数目               |              length('jose')              |                    4                     |
| lpad(string text, length int [, fill text]) | text | 通过填充字符fill(缺省时为空白)，把string填充为长度length。 如果string已经比length长则将其截断(在右边)。 |           lpad('hi', 5, 'xy')            |                  xyxhi                   |
|  ltrim(string text [, characters text])  | text | 从字串string的开头删除只包含characters(缺省是一个空白)的最长的字串。 |         ltrim('zzzytrim','xyz')          |                   trim                   |
|             md5(string text)             | text |       计算给出string的MD5散列，以十六进制返回结果。        |                md5('abc')                |     900150983cd24fb0d6963f7d28e17f72     |
|     repeat(string text, number int)      | text |            重复string number次。             |             repeat('Pg', 4)              |                 PgPgPgPg                 |
| replace(string text, from text, to text) | text |     把字串string里出现地所有子字串from替换成子字串to。      |   replace('abcdefabcdef', 'cd', 'XX')    |               abXXefabXXef               |
| rpad(string text, length int [, fill text]) | text | 通过填充字符fill(缺省时为空白)，把string填充为长度length。如果string已经比length长则将其截断。 |           rpad('hi', 5, 'xy')            |                  hixyx                   |
|  rtrim(string text [, character text])   | text | 从字串string的结尾删除只包含character(缺省是个空白)的最长的字  |          rtrim('trimxxxx','x')           |                   trim                   |
| split_part(string text, delimiter text, field int) | text | 根据delimiter分隔string返回生成的第field个子字串(1 Base)。 | split_part('abc~@~def~@~ghi', '~@~', 2)  |                   def                    |
|        strpos(string, substring)         | text |                声明的子字串的位置。                |           strpos('high','ig')            |                    2                     |
|      substr(string, from [, count])      | text |                  抽取子字串。                  |         substr('alphabet', 3, 2)         |                    ph                    |
|       to_ascii(text [, encoding])        | text |           把text从其它编码转换为ASCII。            |            to_ascii('Karel')             |                  Karel                   |
|        to_hex(number int/bigint)         | text |         把number转换成其对应地十六进制表现形式 。         |       to_hex(9223372036854775807)        |             7fffffffffffffff             |
| translate(string text, from text, to text) | text | 把在string中包含的任何匹配from中的字符的字符转化为对应的在to中的字符。 |      translate('12345', '14', 'ax')      |                  a23x5                   |
# 位串函数和操作符
1.  对于类型bit和bit varying，除了常用的比较操作符之外，还可以使用以下列表中由PostgreSQL提供的位串函数和操作符，其中&、|和#的位串操作数必须等长。在移位的时候，保留原始的位串的的长度。
    | 操作符  |  描述   |          例子          |    结果    |
    | :--: | :---: | :------------------: | :------: |
    | \|\| |  连接   | B'10001' \|\| B'011' | 10001011 |
    |  &   | 按位AND | B'10001' & B'01101'  |  00001   |
    |  \|  | 按位OR  | B'10001' \| B'01101' |  11101   |
    |  \#  | 按位XOR | B'10001' \# B'01101' |  11100   |
    |  ~   | 按位NOT |      ~ B'10001'      |  01110   |
    |  <<  | 按位左移  |    B'10001' << 3     |  01000   |
    |  >>  | 按位右移  |    B'10001' >> 2     |  00100   |

***
位串还可以使用字符串函数：length， bit_length， octet_length， position， substring。此外，我们还可以在整数和bit之间来回转换，如：
```
MyTest=# SELECT 44::bit(10);
        bit
    ------------
     0000101100
    (1 row)
    MyTest=# SELECT 44::bit(3);
     bit
    -----
     100
    (1 row)
    MyTest=# SELECT cast(-44 as bit(12));
         bit
    --------------
     111111010100
    (1 row)
    MyTest=# SELECT '1110'::bit(4)::integer;
     int4
    ------
       14
    (1 row)
    注意：如果只是转换为"bit"，意思是转换成bit(1)，因此只会转换成整数的最低位。
```
