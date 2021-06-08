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
static const char *ng0 = "L:/ProyectoFinal_SistemasEmbebidosFJ21/PF_AES/InvShiftRows.v";
static int ng1[] = {1, 0};
static int ng2[] = {0, 0};



static void Always_31_0(char *t0)
{
    char t11[8];
    char t23[8];
    char t24[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    char *t22;
    char *t25;
    unsigned int t26;
    char *t27;

LAB0:    t1 = (t0 + 3968U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(31, ng0);
    t2 = (t0 + 4536);
    *((int *)t2) = 1;
    t3 = (t0 + 4000);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(32, ng0);

LAB5:    xsi_set_current_line(33, ng0);
    t4 = (t0 + 1048U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(54, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(34, ng0);

LAB9:    xsi_set_current_line(35, ng0);
    t12 = (t0 + 1208U);
    t13 = *((char **)t12);
    memset(t11, 0, 8);
    t12 = (t11 + 4);
    t14 = (t13 + 24);
    t15 = (t13 + 28);
    t16 = *((unsigned int *)t14);
    t17 = (t16 >> 0);
    *((unsigned int *)t11) = t17;
    t18 = *((unsigned int *)t15);
    t19 = (t18 >> 0);
    *((unsigned int *)t12) = t19;
    t20 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t20 & 4294967295U);
    t21 = *((unsigned int *)t12);
    *((unsigned int *)t12) = (t21 & 4294967295U);
    t22 = (t0 + 1928);
    xsi_vlogvar_assign_value(t22, t11, 0, 0, 32);
    xsi_set_current_line(36, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t11, 0, 8);
    t2 = (t11 + 4);
    t4 = (t3 + 16);
    t5 = (t3 + 20);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 0);
    *((unsigned int *)t11) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t10 & 4294967295U);
    t16 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t16 & 4294967295U);
    t12 = (t0 + 2088);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 32);
    xsi_set_current_line(37, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t11, 0, 8);
    t2 = (t11 + 4);
    t4 = (t3 + 8);
    t5 = (t3 + 12);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 0);
    *((unsigned int *)t11) = t7;
    t8 = *((unsigned int *)t5);
    t9 = (t8 >> 0);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t10 & 4294967295U);
    t16 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t16 & 4294967295U);
    t12 = (t0 + 2248);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 32);
    xsi_set_current_line(38, ng0);
    t2 = (t0 + 1208U);
    t3 = *((char **)t2);
    memset(t11, 0, 8);
    t2 = (t11 + 4);
    t4 = (t3 + 4);
    t6 = *((unsigned int *)t3);
    t7 = (t6 >> 0);
    *((unsigned int *)t11) = t7;
    t8 = *((unsigned int *)t4);
    t9 = (t8 >> 0);
    *((unsigned int *)t2) = t9;
    t10 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t10 & 4294967295U);
    t16 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t16 & 4294967295U);
    t5 = (t0 + 2408);
    xsi_vlogvar_assign_value(t5, t11, 0, 0, 32);
    xsi_set_current_line(44, ng0);
    t2 = (t0 + 1928);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2568);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 32);
    xsi_set_current_line(46, ng0);
    t2 = (t0 + 2088);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t23, 0, 8);
    t5 = (t23 + 4);
    t12 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 8);
    *((unsigned int *)t23) = t7;
    t8 = *((unsigned int *)t12);
    t9 = (t8 >> 8);
    *((unsigned int *)t5) = t9;
    t10 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t10 & 16777215U);
    t16 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t16 & 16777215U);
    t13 = (t0 + 2088);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memset(t24, 0, 8);
    t22 = (t24 + 4);
    t25 = (t15 + 4);
    t17 = *((unsigned int *)t15);
    t18 = (t17 >> 0);
    *((unsigned int *)t24) = t18;
    t19 = *((unsigned int *)t25);
    t20 = (t19 >> 0);
    *((unsigned int *)t22) = t20;
    t21 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t21 & 255U);
    t26 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t26 & 255U);
    xsi_vlogtype_concat(t11, 32, 32, 2U, t24, 8, t23, 24);
    t27 = (t0 + 2728);
    xsi_vlogvar_assign_value(t27, t11, 0, 0, 32);
    xsi_set_current_line(48, ng0);
    t2 = (t0 + 2248);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t23, 0, 8);
    t5 = (t23 + 4);
    t12 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 16);
    *((unsigned int *)t23) = t7;
    t8 = *((unsigned int *)t12);
    t9 = (t8 >> 16);
    *((unsigned int *)t5) = t9;
    t10 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t10 & 65535U);
    t16 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t16 & 65535U);
    t13 = (t0 + 2248);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memset(t24, 0, 8);
    t22 = (t24 + 4);
    t25 = (t15 + 4);
    t17 = *((unsigned int *)t15);
    t18 = (t17 >> 0);
    *((unsigned int *)t24) = t18;
    t19 = *((unsigned int *)t25);
    t20 = (t19 >> 0);
    *((unsigned int *)t22) = t20;
    t21 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t21 & 65535U);
    t26 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t26 & 65535U);
    xsi_vlogtype_concat(t11, 32, 32, 2U, t24, 16, t23, 16);
    t27 = (t0 + 2888);
    xsi_vlogvar_assign_value(t27, t11, 0, 0, 32);
    xsi_set_current_line(50, ng0);
    t2 = (t0 + 2408);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    memset(t23, 0, 8);
    t5 = (t23 + 4);
    t12 = (t4 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (t6 >> 24);
    *((unsigned int *)t23) = t7;
    t8 = *((unsigned int *)t12);
    t9 = (t8 >> 24);
    *((unsigned int *)t5) = t9;
    t10 = *((unsigned int *)t23);
    *((unsigned int *)t23) = (t10 & 255U);
    t16 = *((unsigned int *)t5);
    *((unsigned int *)t5) = (t16 & 255U);
    t13 = (t0 + 2408);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memset(t24, 0, 8);
    t22 = (t24 + 4);
    t25 = (t15 + 4);
    t17 = *((unsigned int *)t15);
    t18 = (t17 >> 0);
    *((unsigned int *)t24) = t18;
    t19 = *((unsigned int *)t25);
    t20 = (t19 >> 0);
    *((unsigned int *)t22) = t20;
    t21 = *((unsigned int *)t24);
    *((unsigned int *)t24) = (t21 & 16777215U);
    t26 = *((unsigned int *)t22);
    *((unsigned int *)t22) = (t26 & 16777215U);
    xsi_vlogtype_concat(t11, 32, 32, 2U, t24, 24, t23, 8);
    t27 = (t0 + 3048);
    xsi_vlogvar_assign_value(t27, t11, 0, 0, 32);
    xsi_set_current_line(51, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB8;

}

static void Always_57_1(char *t0)
{
    char t13[32];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;

LAB0:    t1 = (t0 + 4216U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 4552);
    *((int *)t2) = 1;
    t3 = (t0 + 4248);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(58, ng0);

LAB5:    xsi_set_current_line(59, ng0);
    t4 = (t0 + 1768);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 != 0);
    if (t12 > 0)
        goto LAB6;

LAB7:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(60, ng0);

LAB9:    xsi_set_current_line(61, ng0);
    t14 = (t0 + 3048);
    t15 = (t14 + 56U);
    t16 = *((char **)t15);
    t17 = (t0 + 2888);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t0 + 2728);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t0 + 2568);
    t24 = (t23 + 56U);
    t25 = *((char **)t24);
    xsi_vlogtype_concat(t13, 128, 128, 4U, t25, 32, t22, 32, t19, 32, t16, 32);
    t26 = (t0 + 1608);
    xsi_vlogvar_assign_value(t26, t13, 0, 0, 128);
    goto LAB8;

}


extern void work_m_00000000002592232157_1590192449_init()
{
	static char *pe[] = {(void *)Always_31_0,(void *)Always_57_1};
	xsi_register_didat("work_m_00000000002592232157_1590192449", "isim/AES_Decryptor_isim_beh.exe.sim/work/m_00000000002592232157_1590192449.didat");
	xsi_register_executes(pe);
}
