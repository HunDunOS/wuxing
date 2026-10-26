00 ============================================================
00 五行 V13 终极满编矩阵 解释器 v0.25
00 ============================================================

00 ---- 全局变量 ----
ts g_src = 0
ts g_pos = 0
ts g_len = 0

00 ---- 函数 ----
tt zhu 01 fname 02 -> u64  08
    00 主函数
    st dd 03wuxing interpreter v0.2504
    00 硬编码测试字符串
    g_src = 03jj hello world04
    g_len = 14
    g_pos = 0
    00 开始解释
    zt interpret 01 02
    zz 0
 09

00 ============================================================
00 解释器主循环
00 ============================================================
tt interpret 01  02 -> u64  08
    st dd 03interpret loop started04
    00 主循环
    ll  08
        lz g_pos g_len  08 ls  09
        00 读下一个字符
        tz c = fh 01 g_src ht g_pos 02
        g_pos = g_pos ht 1
        00 识别 jj 指令
        lz c 106  08
            00 打印 -（调试）
            zt _rt_putc 01 45 02
            00 读下一个字符
            tz c2 = fh 01 g_src ht g_pos 02
            g_pos = g_pos ht 1
            lz c2 106  08
                00 识别 jj！跳过空格
                ll  08
                    lz g_pos g_len  08 ls  09
                    tz sc = fh 01 g_src ht g_pos 02
                    lh sc 32  08 ls  09
                    g_pos = g_pos ht 1
                 09
                00 打印字符串！
                ll  08
                    lz g_pos g_len  08 ls  09
                    tz pc = fh 01 g_src ht g_pos 02
                    lz pc 32  08 ls  09
                    lz pc 10  08 ls  09
                    zt _rt_putc 01 pc 02
                    g_pos = g_pos ht 1
                 09
                zt _rt_putc 01 10 02
             09
         09
     09
    zz 0
 09
