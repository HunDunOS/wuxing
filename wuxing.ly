00 ============================================================
00 五行 V13 终极满编矩阵 解释器 v2.4
00 新增：tj变量、hh加法、hz减法、Xj if分支、ll循环
00 ============================================================

00 ---- 全局变量 ----
ts g_src = 0
ts g_pos = 0
ts g_len = 0
ts g_argc = 0
ts g_argv = 0
ts g_vars[16] = 0

00 ---- 函数 ----
tt zhu 01 fname 02 -> u64  08
    st 03wuxing interpreter v2.404
    g_src = 03jj hello world04
    g_len = 14
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

        00 识别 jj = 打印字符串
        lh c 106  08
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

        00 识别 tj = 变量声明
        lh c 116  08
            tz c2 = fh 01 g_src ht g_pos 02
            g_pos = g_pos ht 1
            lh c2 106  08
                st 03tj: var decl04
             09
         09

     09
    zz 0
 09
