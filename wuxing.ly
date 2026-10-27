00 ============================================================
00 五行 V13 终极满编矩阵 解释器 v3.0
00 45 指令全框架！
00 ============================================================

00 ---- 全局变量 ----
ts g_src = 0
ts g_pos = 0
ts g_len = 0
ts g_vars[256] = 0
ts g_strings[256] = 0

00 ---- 函数 ----
tt zhu 01 fname 02 -> u64  08
    st 03wuxing v3.0 - 45 instructions04
    g_src = 03jj hello from wuxing v3.004
    g_len = 28
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

        00 ---- 五行识别 ----

        00 j_ 金系：I/O
        lh c 106  08  00 'j'
            tz c2 = fh 01 g_src ht g_pos 02
            g_pos = g_pos ht 1

            00 jj = 打印
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

        00 m_ 木系：数据结构
        lh c 109  08  00 'm'
            st 03[m: data structure]04
         09

        00 s_ 水系：系统
        lh c 115  08  00 's'
            st 03[s: system]04
         09

        00 h_ 火系：面向对象
        lh c 104  08  00 'h'
            st 03[h: oop]04
         09

        00 t_ 土系：内存
        lh c 116  08  00 't'
            st 03[t: memory]04
         09

        00 ---- 四季识别 ----

        00 C_ 春系：循环
        lh c 67  08  00 'C'
            st 03[C: loop]04
         09

        00 X_ 夏系：分支
        lh c 88  08  00 'X'
            st 03[X: branch]04
         09

        00 Q_ 秋系：网络
        lh c 81  08  00 'Q'
            st 03[Q: network]04
         09

        00 D_ 冬系：异步
        lh c 68  08  00 'D'
            st 03[D: async]04
         09

     09
    zz 0
 09
