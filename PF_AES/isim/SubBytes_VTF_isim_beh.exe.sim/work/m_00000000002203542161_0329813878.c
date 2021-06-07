/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "L:/Escuela/Profesional/Semestre 10/Sistemas Embebidos/PF_AES/SubBytes_VTF.v";
static int ng1[] = {0, 0};
static int ng2[] = {0, 0, 0, 0, 0, 0, 0, 0};
static int ng3[] = {1, 0};
static unsigned int ng4[] = {0U, 0U};
static const char *ng5 = "***PassRedy0***";
static const char *ng6 = "***ERROR0: Ry_SBT = %h and must be  0***";
static unsigned int ng7[] = {3190499848U, 0U, 3823275336U, 0U, 1039451896U, 0U, 429955817U, 0U};
static unsigned int ng8[] = {2935088432U, 0U, 295198034U, 0U, 666874945U, 0U, 3571496990U, 0U};
static unsigned int ng9[] = {1U, 0U};
static const char *ng10 = "***Pass sub0***";
static const char *ng11 = "***ERROR sub0: Out_ARK = %h and must be  hd4e0b81e27bfb44111985d52aef1e530***";
static const char *ng12 = "***PassRedy1***";
static const char *ng13 = "***ERROR1: Ry_SBT = %h and must be  0***";
static unsigned int ng14[] = {4062921545U, 0U, 2134239824U, 0U, 2627689322U, 0U, 2758306562U, 0U};
static unsigned int ng15[] = {2314279483U, 0U, 3533080403U, 0U, 3738908930U, 0U, 1229291383U, 0U};
static const char *ng16 = "***Pass sub1***";
static const char *ng17 = "***ERROR sub1: Out_ARK = %h and must be  h49457f77dedb3902d296875389f11a3b***";



static void Always_47_0(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 3008U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(48, ng0);

LAB4:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 2816);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(49, ng0);
    t4 = (t0 + 1768);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t3, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB9;

LAB7:    if (*((unsigned int *)t7) == 0)
        goto LAB6;

LAB8:    t13 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t13) = 1;

LAB9:    t14 = (t3 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t3) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB11;

LAB10:    t22 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 1768);
    xsi_vlogvar_assign_value(t24, t3, 0, 0, 1);
    xsi_set_current_line(49, ng0);
    t2 = (t0 + 2816);
    xsi_process_wait(t2, 10000LL);
    *((char **)t1) = &&LAB12;
    goto LAB1;

LAB6:    *((unsigned int *)t3) = 1;
    goto LAB9;

LAB11:    t18 = *((unsigned int *)t3);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t3) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB10;

LAB12:    xsi_set_current_line(49, ng0);
    t4 = (t0 + 1768);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t3, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB16;

LAB14:    if (*((unsigned int *)t7) == 0)
        goto LAB13;

LAB15:    t13 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t13) = 1;

LAB16:    t14 = (t3 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t3) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB18;

LAB17:    t22 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 1768);
    xsi_vlogvar_assign_value(t24, t3, 0, 0, 1);
    goto LAB2;

LAB13:    *((unsigned int *)t3) = 1;
    goto LAB16;

LAB18:    t18 = *((unsigned int *)t3);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t3) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB17;

}

static void Initial_51_1(char *t0)
{
    char t4[8];
    char t26[32];
    char t28[8];
    char t35[8];
    char t43[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    char *t19;
    char *t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    char *t27;
    char *t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    char *t42;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    char *t47;
    char *t48;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    char *t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    unsigned int t65;
    unsigned int t66;
    int t67;
    int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    unsigned int t74;
    char *t75;
    unsigned int t76;
    unsigned int t77;
    unsigned int t78;
    unsigned int t79;
    unsigned int t80;

LAB0:    t1 = (t0 + 3256U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(51, ng0);

LAB4:    xsi_set_current_line(53, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(54, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(55, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(56, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 128);
    xsi_set_current_line(59, ng0);
    t2 = (t0 + 3064);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(63, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(63, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(63, ng0);
    t2 = (t0 + 3064);
    xsi_process_wait(t2, 20000LL);
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(63, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(63, ng0);
    t2 = (t0 + 3064);
    xsi_process_wait(t2, 20000LL);
    *((char **)t1) = &&LAB7;
    goto LAB1;

LAB7:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t4, 0, 8);
    t5 = (t3 + 4);
    t6 = (t2 + 4);
    t7 = *((unsigned int *)t3);
    t8 = *((unsigned int *)t2);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = (t9 | t12);
    t14 = *((unsigned int *)t5);
    t15 = *((unsigned int *)t6);
    t16 = (t14 | t15);
    t17 = (~(t16));
    t18 = (t13 & t17);
    if (t18 != 0)
        goto LAB11;

LAB8:    if (t16 != 0)
        goto LAB10;

LAB9:    *((unsigned int *)t4) = 1;

LAB11:    t20 = (t4 + 4);
    t21 = *((unsigned int *)t20);
    t22 = (~(t21));
    t23 = *((unsigned int *)t4);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB12;

LAB13:    xsi_set_current_line(69, ng0);

LAB16:    xsi_set_current_line(70, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    xsi_vlogfile_write(1, 0, 0, ng6, 2, t0, (char)118, t3, 1);

LAB14:    xsi_set_current_line(73, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 128);
    xsi_set_current_line(74, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(74, ng0);
    t2 = (t0 + 3064);
    xsi_process_wait(t2, 20000LL);
    *((char **)t1) = &&LAB17;
    goto LAB1;

LAB10:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB11;

LAB12:    xsi_set_current_line(65, ng0);

LAB15:    xsi_set_current_line(66, ng0);
    xsi_vlogfile_write(1, 0, 0, ng5, 1, t0);
    goto LAB14;

LAB17:    xsi_set_current_line(75, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng8)));
    xsi_vlog_unsigned_equal(t26, 128, t3, 128, t2, 128);
    memset(t4, 0, 8);
    t5 = (t26 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t26);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB18;

LAB19:    if (*((unsigned int *)t5) != 0)
        goto LAB20;

LAB21:    t19 = (t4 + 4);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t19);
    t14 = (t12 || t13);
    if (t14 > 0)
        goto LAB22;

LAB23:    memcpy(t43, t4, 8);

LAB24:    t75 = (t43 + 4);
    t76 = *((unsigned int *)t75);
    t77 = (~(t76));
    t78 = *((unsigned int *)t43);
    t79 = (t78 & t77);
    t80 = (t79 != 0);
    if (t80 > 0)
        goto LAB36;

LAB37:    xsi_set_current_line(80, ng0);

LAB40:    xsi_set_current_line(81, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    xsi_vlogfile_write(1, 0, 0, ng11, 2, t0, (char)118, t3, 128);

LAB38:    xsi_set_current_line(84, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(84, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(84, ng0);
    t2 = (t0 + 3064);
    xsi_process_wait(t2, 20000LL);
    *((char **)t1) = &&LAB41;
    goto LAB1;

LAB18:    *((unsigned int *)t4) = 1;
    goto LAB21;

LAB20:    t6 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t6) = 1;
    goto LAB21;

LAB22:    t20 = (t0 + 1048U);
    t27 = *((char **)t20);
    t20 = ((char*)((ng9)));
    memset(t28, 0, 8);
    t29 = (t27 + 4);
    t30 = (t20 + 4);
    t15 = *((unsigned int *)t27);
    t16 = *((unsigned int *)t20);
    t17 = (t15 ^ t16);
    t18 = *((unsigned int *)t29);
    t21 = *((unsigned int *)t30);
    t22 = (t18 ^ t21);
    t23 = (t17 | t22);
    t24 = *((unsigned int *)t29);
    t25 = *((unsigned int *)t30);
    t31 = (t24 | t25);
    t32 = (~(t31));
    t33 = (t23 & t32);
    if (t33 != 0)
        goto LAB28;

LAB25:    if (t31 != 0)
        goto LAB27;

LAB26:    *((unsigned int *)t28) = 1;

LAB28:    memset(t35, 0, 8);
    t36 = (t28 + 4);
    t37 = *((unsigned int *)t36);
    t38 = (~(t37));
    t39 = *((unsigned int *)t28);
    t40 = (t39 & t38);
    t41 = (t40 & 1U);
    if (t41 != 0)
        goto LAB29;

LAB30:    if (*((unsigned int *)t36) != 0)
        goto LAB31;

LAB32:    t44 = *((unsigned int *)t4);
    t45 = *((unsigned int *)t35);
    t46 = (t44 & t45);
    *((unsigned int *)t43) = t46;
    t47 = (t4 + 4);
    t48 = (t35 + 4);
    t49 = (t43 + 4);
    t50 = *((unsigned int *)t47);
    t51 = *((unsigned int *)t48);
    t52 = (t50 | t51);
    *((unsigned int *)t49) = t52;
    t53 = *((unsigned int *)t49);
    t54 = (t53 != 0);
    if (t54 == 1)
        goto LAB33;

LAB34:
LAB35:    goto LAB24;

LAB27:    t34 = (t28 + 4);
    *((unsigned int *)t28) = 1;
    *((unsigned int *)t34) = 1;
    goto LAB28;

LAB29:    *((unsigned int *)t35) = 1;
    goto LAB32;

LAB31:    t42 = (t35 + 4);
    *((unsigned int *)t35) = 1;
    *((unsigned int *)t42) = 1;
    goto LAB32;

LAB33:    t55 = *((unsigned int *)t43);
    t56 = *((unsigned int *)t49);
    *((unsigned int *)t43) = (t55 | t56);
    t57 = (t4 + 4);
    t58 = (t35 + 4);
    t59 = *((unsigned int *)t4);
    t60 = (~(t59));
    t61 = *((unsigned int *)t57);
    t62 = (~(t61));
    t63 = *((unsigned int *)t35);
    t64 = (~(t63));
    t65 = *((unsigned int *)t58);
    t66 = (~(t65));
    t67 = (t60 & t62);
    t68 = (t64 & t66);
    t69 = (~(t67));
    t70 = (~(t68));
    t71 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t71 & t69);
    t72 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t72 & t70);
    t73 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t73 & t69);
    t74 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t74 & t70);
    goto LAB35;

LAB36:    xsi_set_current_line(76, ng0);

LAB39:    xsi_set_current_line(77, ng0);
    xsi_vlogfile_write(1, 0, 0, ng10, 1, t0);
    goto LAB38;

LAB41:    xsi_set_current_line(84, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1608);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(84, ng0);
    t2 = (t0 + 3064);
    xsi_process_wait(t2, 20000LL);
    *((char **)t1) = &&LAB42;
    goto LAB1;

LAB42:    xsi_set_current_line(85, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng4)));
    memset(t4, 0, 8);
    t5 = (t3 + 4);
    t6 = (t2 + 4);
    t7 = *((unsigned int *)t3);
    t8 = *((unsigned int *)t2);
    t9 = (t7 ^ t8);
    t10 = *((unsigned int *)t5);
    t11 = *((unsigned int *)t6);
    t12 = (t10 ^ t11);
    t13 = (t9 | t12);
    t14 = *((unsigned int *)t5);
    t15 = *((unsigned int *)t6);
    t16 = (t14 | t15);
    t17 = (~(t16));
    t18 = (t13 & t17);
    if (t18 != 0)
        goto LAB46;

LAB43:    if (t16 != 0)
        goto LAB45;

LAB44:    *((unsigned int *)t4) = 1;

LAB46:    t20 = (t4 + 4);
    t21 = *((unsigned int *)t20);
    t22 = (~(t21));
    t23 = *((unsigned int *)t4);
    t24 = (t23 & t22);
    t25 = (t24 != 0);
    if (t25 > 0)
        goto LAB47;

LAB48:    xsi_set_current_line(90, ng0);

LAB51:    xsi_set_current_line(91, ng0);
    t2 = (t0 + 1048U);
    t3 = *((char **)t2);
    xsi_vlogfile_write(1, 0, 0, ng13, 2, t0, (char)118, t3, 1);

LAB49:    xsi_set_current_line(94, ng0);
    t2 = ((char*)((ng14)));
    t3 = (t0 + 2088);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 128);
    xsi_set_current_line(95, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    xsi_set_current_line(95, ng0);
    t2 = (t0 + 3064);
    xsi_process_wait(t2, 20000LL);
    *((char **)t1) = &&LAB52;
    goto LAB1;

LAB45:    t19 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t19) = 1;
    goto LAB46;

LAB47:    xsi_set_current_line(86, ng0);

LAB50:    xsi_set_current_line(87, ng0);
    xsi_vlogfile_write(1, 0, 0, ng12, 1, t0);
    goto LAB49;

LAB52:    xsi_set_current_line(96, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    t2 = ((char*)((ng15)));
    xsi_vlog_unsigned_equal(t26, 128, t3, 128, t2, 128);
    memset(t4, 0, 8);
    t5 = (t26 + 4);
    t7 = *((unsigned int *)t5);
    t8 = (~(t7));
    t9 = *((unsigned int *)t26);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB53;

LAB54:    if (*((unsigned int *)t5) != 0)
        goto LAB55;

LAB56:    t19 = (t4 + 4);
    t12 = *((unsigned int *)t4);
    t13 = *((unsigned int *)t19);
    t14 = (t12 || t13);
    if (t14 > 0)
        goto LAB57;

LAB58:    memcpy(t43, t4, 8);

LAB59:    t75 = (t43 + 4);
    t76 = *((unsigned int *)t75);
    t77 = (~(t76));
    t78 = *((unsigned int *)t43);
    t79 = (t78 & t77);
    t80 = (t79 != 0);
    if (t80 > 0)
        goto LAB71;

LAB72:    xsi_set_current_line(101, ng0);

LAB75:    xsi_set_current_line(102, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    xsi_vlogfile_write(1, 0, 0, ng17, 2, t0, (char)118, t3, 128);

LAB73:    goto LAB1;

LAB53:    *((unsigned int *)t4) = 1;
    goto LAB56;

LAB55:    t6 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t6) = 1;
    goto LAB56;

LAB57:    t20 = (t0 + 1048U);
    t27 = *((char **)t20);
    t20 = ((char*)((ng9)));
    memset(t28, 0, 8);
    t29 = (t27 + 4);
    t30 = (t20 + 4);
    t15 = *((unsigned int *)t27);
    t16 = *((unsigned int *)t20);
    t17 = (t15 ^ t16);
    t18 = *((unsigned int *)t29);
    t21 = *((unsigned int *)t30);
    t22 = (t18 ^ t21);
    t23 = (t17 | t22);
    t24 = *((unsigned int *)t29);
    t25 = *((unsigned int *)t30);
    t31 = (t24 | t25);
    t32 = (~(t31));
    t33 = (t23 & t32);
    if (t33 != 0)
        goto LAB63;

LAB60:    if (t31 != 0)
        goto LAB62;

LAB61:    *((unsigned int *)t28) = 1;

LAB63:    memset(t35, 0, 8);
    t36 = (t28 + 4);
    t37 = *((unsigned int *)t36);
    t38 = (~(t37));
    t39 = *((unsigned int *)t28);
    t40 = (t39 & t38);
    t41 = (t40 & 1U);
    if (t41 != 0)
        goto LAB64;

LAB65:    if (*((unsigned int *)t36) != 0)
        goto LAB66;

LAB67:    t44 = *((unsigned int *)t4);
    t45 = *((unsigned int *)t35);
    t46 = (t44 & t45);
    *((unsigned int *)t43) = t46;
    t47 = (t4 + 4);
    t48 = (t35 + 4);
    t49 = (t43 + 4);
    t50 = *((unsigned int *)t47);
    t51 = *((unsigned int *)t48);
    t52 = (t50 | t51);
    *((unsigned int *)t49) = t52;
    t53 = *((unsigned int *)t49);
    t54 = (t53 != 0);
    if (t54 == 1)
        goto LAB68;

LAB69:
LAB70:    goto LAB59;

LAB62:    t34 = (t28 + 4);
    *((unsigned int *)t28) = 1;
    *((unsigned int *)t34) = 1;
    goto LAB63;

LAB64:    *((unsigned int *)t35) = 1;
    goto LAB67;

LAB66:    t42 = (t35 + 4);
    *((unsigned int *)t35) = 1;
    *((unsigned int *)t42) = 1;
    goto LAB67;

LAB68:    t55 = *((unsigned int *)t43);
    t56 = *((unsigned int *)t49);
    *((unsigned int *)t43) = (t55 | t56);
    t57 = (t4 + 4);
    t58 = (t35 + 4);
    t59 = *((unsigned int *)t4);
    t60 = (~(t59));
    t61 = *((unsigned int *)t57);
    t62 = (~(t61));
    t63 = *((unsigned int *)t35);
    t64 = (~(t63));
    t65 = *((unsigned int *)t58);
    t66 = (~(t65));
    t67 = (t60 & t62);
    t68 = (t64 & t66);
    t69 = (~(t67));
    t70 = (~(t68));
    t71 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t71 & t69);
    t72 = *((unsigned int *)t49);
    *((unsigned int *)t49) = (t72 & t70);
    t73 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t73 & t69);
    t74 = *((unsigned int *)t43);
    *((unsigned int *)t43) = (t74 & t70);
    goto LAB70;

LAB71:    xsi_set_current_line(97, ng0);

LAB74:    xsi_set_current_line(98, ng0);
    xsi_vlogfile_write(1, 0, 0, ng16, 1, t0);
    goto LAB73;

}


extern void work_m_00000000002203542161_0329813878_init()
{
	static char *pe[] = {(void *)Always_47_0,(void *)Initial_51_1};
	xsi_register_didat("work_m_00000000002203542161_0329813878", "isim/SubBytes_VTF_isim_beh.exe.sim/work/m_00000000002203542161_0329813878.didat");
	xsi_register_executes(pe);
}
