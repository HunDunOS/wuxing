00 ============================================================
00 五行 v0.9 测试版
00 ============================================================

ts g_vars[26] = 0

tt zhu 01 fname 02 -> u64  08
    st dd "wuxing v0.9 test'

    00 tj a 10
    g_vars[0] = 10

    00 tj b 20
    g_vars[1] = 20

    00 tj c a+b
    g_vars[2] = g_vars[0] ht g_vars[1]

    00 jj c
    tz n = g_vars[2]
    tz d = n / 10 ht 48
    zt _rt_putc 01 d 02
    tz d2 = n % 10 ht 48
    zt _rt_putc 01 d2 02
    zt _rt_putc 01 10 02

    zz 0
 09
