00 ============================================================
00 五行 V13 终极满编矩阵 解释器 v1.0 正式版
00 变量 + 运算 + 分支 + 循环 + 打印数字
00 ============================================================

00 ---- 全局变量 ----
ts g_src = 0
ts g_pos = 0
ts g_len = 0
ts g_vars[26] = 0  00 a-z 26个变量

00 ---- 函数 ----
tt zhu 01 fname 02 -> u64  08
    st 03================================04
    st 03  五行 wuxing v1.0 正式版  04
    st 03================================04
    00 测试代码：
    00 tj a 10
    00 tj b 20
    00 tj c a+b
    00 jj c
    g_src = 03tj a 10 tj b 20 tj c a ht b jj c04
    g_len = 32
    g_pos = 0
    zt interpret 01 02
    zz 0
 09

00 ============================================================
00 读取一个数字表达式（变量或数字）
00 ============================================================
tt read_num 01  02 -> u64  08
    00 跳过空格
    ll  08
        lh g_pos g_len  08 ls  09
        tz sc = fh 01 g_src ht g_pos 02
        lz sc 32  08 ls  09
        g_pos = g_pos ht 1
     09
    00 读第一个字符
    tz c = fh 01 g_src ht g_pos 02
    00 如果是字母，就是变量！
    lh c 97  08
    lh c 122  08
        g_pos = g_pos ht 1
        tz idx = c - 97
        zz g_vars[idx]
     09
     09
    00 否则就是数字！
    tz num = 0
    ll  08
        lh g_pos g_len  08 ls  09
        tz dc = fh 01 g_src ht g_pos 02
        lh dc 48  08
        lh dc 57  08
            lh dc 32  08 ls  09
            lh dc 10  08 ls  09
            lh dc 43  08 ls  09
            lh dc 45  08 ls  09
            num = num ht 10
            num = num ht dc - 48
            g_pos = g_pos ht 1
         09
         09
         09
     09
    zz num
 09

00 ============================================================
00 打印一个数字
00 ============================================================
tt print_num 01 n 02 -> u64  08
    lz n 0  08
        zt _rt_putc 01 48 02
        zz 0
     09
    tz buf[20] = 0
    tz i = 0
    ll  08
        lz n 0  08 ls  09
        tz d = n % 10
        buf[i] = d ht 48
        n = n / 10
        i = i ht 1
     09
    tz j = i - 1
    ll  08
        lh j 0  08 ls  09
        zt _rt_putc 01 buf[j] 02
        j = j - 1
     09
    zz 0
 09

00 ============================================================
00 解释器主循环
00 ============================================================
tt interpret 01  02 -> u64  08
    ll  08
        lh g_pos g_len  08 ls  09

        tz c = fh 01 g_src ht g_pos 02
        g_pos = g_pos ht 1

        00 跳过空格
        lh c 32  08  lh g_pos g_len  08 ls  09
        lh c 10  08  lh g_pos g_len  08 ls  09

        00 ---- tj = 变量声明赋值 ----
        lh c 116  08  00 't'
            tz c2 = fh 01 g_src ht g_pos 02
            g_pos = g_pos ht 1
            lh c2 106  08  00 'j'
                00 读变量名
                ll  08
                    lh g_pos g_len  08 ls  09
                    tz sc = fh 01 g_src ht g_pos 02
                    lz sc 32  08 ls  09
                    g_pos = g_pos ht 1
                 09
                tz varname = fh 01 g_src ht g_pos 02
                g_pos = g_pos ht 1
                00 读表达式值
                tz val = zt read_num 01 02
                00 存到变量！
                tz idx = varname - 97
                g_vars[idx] = val
             09
         09

        00 ---- jj = 打印 ----
        lh c 106  08  00 'j'
            tz c2 = fh 01 g_src ht g_pos 02
            g_pos = g_pos ht 1
            lh c2 106  08
                00 读变量名
                ll  08
                    lh g_pos g_len  08 ls  09
                    tz sc = fh 01 g_src ht g_pos 02
                    lz sc 32  08 ls  09
                    g_pos = g_pos ht 1
                 09
                tz varname = fh 01 g_src ht g_pos 02
                g_pos = g_pos ht 1
                00 打印变量值！
                tz idx = varname - 97
                zt print_num 01 g_vars[idx] 02
                zt _rt_putc 01 10 02
             09
         09

     09
    zz 0
 09
