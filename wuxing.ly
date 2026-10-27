00 ============================================================
00 五行 V13 终极满编矩阵 解释器 v3.1
00 新增：tj变量赋值、ht加法、hz减法
00 ============================================================

00 ---- 全局变量 ----
ts g_src = 0
ts g_pos = 0
ts g_len = 0
ts g_vars[26] = 0  00 a-z 26个变量

00 ---- 函数 ----
tt zhu 01 fname 02 -> u64  08
    st 03wuxing v3.104
    g_src = 03tj a 42 04
    g_len = 10
    g_pos = 0
    zt interpret 01 02
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
        lh c 9   08  lh g_pos g_len  08 ls  09

        00 ---- tj = 变量声明赋值 ----
        lh c 116  08  00 't'
            tz c2 = fh 01 g_src ht g_pos 02
            g_pos = g_pos ht 1
            lh c2 106  08  00 'j'
                00 跳过空格
                ll  08
                    lh g_pos g_len  08 ls  09
                    tz sc = fh 01 g_src ht g_pos 02
                    lz sc 32  08 ls  09
                    g_pos = g_pos ht 1
                 09
                00 读变量名（a-z）
                tz varname = fh 01 g_src ht g_pos 02
                g_pos = g_pos ht 1
                00 跳过空格
                ll  08
                    lh g_pos g_len  08 ls  09
                    tz sc = fh 01 g_src ht g_pos 02
                    lz sc 32  08 ls  09
                    g_pos = g_pos ht 1
                 09
                00 读数字
                tz num = 0
                ll  08
                    lh g_pos g_len  08 ls  09
                    tz dc = fh 01 g_src ht g_pos 02
                    lh dc 48  08
                    lh dc 57  08
                        lh dc 32  08 ls  09
                        lh dc 10  08 ls  09
                        num = num ht 10
                        num = num ht dc - 48
                        g_pos = g_pos ht 1
                     09
                     09
                     09
                 09
                00 存到变量！
                tz idx = varname - 97
                g_vars[idx] = num
                st 03[var set]04
             09
         09

        00 ---- jj = 打印 ----
        lh c 106  08  00 'j'
            tz c2 = fh 01 g_src ht g_pos 02
            g_pos = g_pos ht 1
            lh c2 106  08
                ll  08
                    lh g_pos g_len  08 ls  09
                    tz sc = fh 01 g_src ht g_pos 02
                    lz sc 32  08 ls  09
                    g_pos = g_pos ht 1
                 09
                ll  08
                    lh g_pos g_len  08 ls  09
                    tz pc = fh 01 g_src ht g_pos 02
                    lh pc 32  08 ls  09
                    lh pc 10  08 ls  09
                    zt _rt_putc 01 pc 02
                    g_pos = g_pos ht 1
                 09
                zt _rt_putc 01 10 02
             09
         09

     09
    zz 0
 09
