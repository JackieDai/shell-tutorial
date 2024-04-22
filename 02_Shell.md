[TOC]



## Login Unix

Type the `login` cmd in terminal, then you will see the follows.

![](https://raw.githubusercontent.com/JackieDai/blogAssets/main/202402210920637.png)

## Shell

> "Shell" 含义如下：
>
> 1. **贝壳（Shell）**：通常指海洋生物或陆地生物的外壳，例如蜗牛、海螺等动物的外壳。
>
> 2. **外壳（Shell）**：除了生物学上的外壳外，这个词还可以指一些物体的外部覆盖物，例如蛋壳、坚果壳等。
>
> 3. **炮弹（Shell）**：在军事上，"shell" 可以指炮弹或弹药，尤其是火炮、炮弩等武器的发射物。
>
> 4. **外壳（Shell）**：<u>在计算机科学和操作系统领域，"shell" 通常指命令行界面（Command Line Interface，CLI）的外壳，用于用户与计算机操作系统进行交互。</u>
>
> 5. **公司（Shell）**："Shell" 还是一家国际性的能源公司的名称，全称是 Royal Dutch Shell，主要从事石油、天然气和其他能源资源的勘探、生产、运输和销售业务。

## shell definition

[参考链接](https://www.tutorialspoint.com/unix/unix-what-is-shell.htm)

A shell is a command-line interpreter and typical operations performed by shell scripts include file manipulation, program execution, and printing text.

> The Shell is a programing language. No matter how complicated a script gets, it is still just a list of commands executed sequentially.

### First Experience

Open text.sh file, and input the follow content.

> the **read** command which <u>takes the input</u> from the keyboard and assigns it as the value of the variable PERSON and finally prints it on STDOUT.

```shell
#!/bin/sh
echo "What is your name?"
read PERSON
echo "Hello, $PERSON"
```

then execute the script file in terminal.

```
sh /path/test.sh
```

The result is as follows:

```
What is your name?
lingxiao.dai
Hello, lingxiao.dai
```

> Note:
>
> A shell script is a list of cmds, which are listed in the order of execution.

Here is another example:

```
#!/bin/bash
pwd
ls
```

> \#: means she [hashable] 
>
> \!: means bang
