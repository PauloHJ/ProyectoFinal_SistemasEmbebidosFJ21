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
static const char *ng0 = "L:/Escuela/Profesional/Semestre 10/Sistemas Embebidos/PF_AES/SubBytes.v";
static const char *ng1 = "sbox.mem";
static int ng2[] = {0, 0, 0, 0, 0, 0, 0, 0};
static int ng3[] = {0, 0};
static int ng4[] = {16, 0};
static int ng5[] = {127, 0};
static int ng6[] = {8, 0};
static int ng7[] = {1, 0};



static void Initial_37_0(char *t0)
{
    char *t1;
    char *t2;

LAB0:    xsi_set_current_line(37, ng0);

LAB2:    xsi_set_current_line(38, ng0);
    t1 = (t0 + 2544);
    xsi_vlogfile_readmemh(ng1, 0, t1, 0, 0, 0, 0);
    xsi_set_current_line(39, ng0);
    t1 = ((char*)((ng2)));
    t2 = (t0 + 2384);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 128);
    xsi_set_current_line(40, ng0);
    t1 = ((char*)((ng3)));
    t2 = (t0 + 2064);
    xsi_vlogvar_assign_value(t2, t1, 0, 0, 1);

LAB1:    return;
}

static void Always_45_1(char *t0)
{
    char t13[8];
    char t16[8];
    char t23[8];
    char t33[8];
    char t34[8];
    char t37[8];
    char t38[8];
    char t39[8];
    char t48[8];
    char t49[8];
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
    char *t11;
    char *t12;
    char *t14;
    char *t15;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    char *t32;
    char *t35;
    char *t36;
    char *t40;
    char *t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t50;
    char *t51;
    unsigned int t52;
    int t53;
    char *t54;
    unsigned int t55;
    int t56;
    int t57;
    char *t58;
    unsigned int t59;
    int t60;
    int t61;
    unsigned int t62;
    int t63;
    unsigned int t64;
    unsigned int t65;
    int t66;
    int t67;

LAB0:    t1 = (t0 + 3872U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(45, ng0);
    t2 = (t0 + 4192);
    *((int *)t2) = 1;
    t3 = (t0 + 3904);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(46, ng0);

LAB5:    xsi_set_current_line(47, ng0);
    t4 = (t0 + 1184U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB6;

LAB7:    xsi_set_current_line(53, ng0);
    t2 = (t0 + 1504U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB10;

LAB11:    xsi_set_current_line(63, ng0);

LAB20:    xsi_set_current_line(64, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2064);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB12:
LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(48, ng0);

LAB9:    xsi_set_current_line(49, ng0);
    t11 = ((char*)((ng2)));
    t12 = (t0 + 2384);
    xsi_vlogvar_assign_value(t12, t11, 0, 0, 128);
    xsi_set_current_line(50, ng0);
    t2 = ((char*)((ng3)));
    t3 = (t0 + 2064);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB8;

LAB10:    xsi_set_current_line(54, ng0);

LAB13:    xsi_set_current_line(55, ng0);
    xsi_set_current_line(55, ng0);
    t4 = ((char*)((ng3)));
    t5 = (t0 + 2704);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 32);

LAB14:    t2 = (t0 + 2704);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng4)));
    memset(t13, 0, 8);
    xsi_vlog_signed_less(t13, 32, t4, 32, t5, 32);
    t11 = (t13 + 4);
    t6 = *((unsigned int *)t11);
    t7 = (~(t6));
    t8 = *((unsigned int *)t13);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB15;

LAB16:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 2384);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2224);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 128);
    xsi_set_current_line(60, ng0);
    t2 = ((char*)((ng7)));
    t3 = (t0 + 2064);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB12;

LAB15:    xsi_set_current_line(56, ng0);

LAB17:    xsi_set_current_line(57, ng0);
    t12 = (t0 + 2544);
    t14 = (t12 + 56U);
    t15 = *((char **)t14);
    t17 = (t0 + 2544);
    t18 = (t17 + 72U);
    t19 = *((char **)t18);
    t20 = (t0 + 2544);
    t21 = (t20 + 64U);
    t22 = *((char **)t21);
    t24 = (t0 + 1664U);
    t25 = *((char **)t24);
    t24 = (t0 + 1624U);
    t26 = (t24 + 72U);
    t27 = *((char **)t26);
    t28 = ((char*)((ng5)));
    t29 = ((char*)((ng6)));
    t30 = (t0 + 2704);
    t31 = (t30 + 56U);
    t32 = *((char **)t31);
    memset(t33, 0, 8);
    xsi_vlog_signed_multiply(t33, 32, t29, 32, t32, 32);
    memset(t34, 0, 8);
    xsi_vlog_signed_minus(t34, 32, t28, 32, t33, 32);
    t35 = ((char*)((ng6)));
    xsi_vlog_get_indexed_partselect(t23, 8, t25, ((int*)(t27)), 2, t34, 32, 1, t35, 32, 1, 0);
    xsi_vlog_generic_get_array_select_value(t16, 8, t15, t19, t22, 2, 1, t23, 8, 2);
    t36 = (t0 + 2384);
    t40 = (t0 + 2384);
    t41 = (t40 + 72U);
    t42 = *((char **)t41);
    t43 = ((char*)((ng5)));
    t44 = ((char*)((ng6)));
    t45 = (t0 + 2704);
    t46 = (t45 + 56U);
    t47 = *((char **)t46);
    memset(t48, 0, 8);
    xsi_vlog_signed_multiply(t48, 32, t44, 32, t47, 32);
    memset(t49, 0, 8);
    xsi_vlog_signed_minus(t49, 32, t43, 32, t48, 32);
    t50 = ((char*)((ng6)));
    xsi_vlog_convert_indexed_partindices(t37, t38, t39, ((int*)(t42)), 2, t49, 32, 1, t50, 32, 1, 0);
    t51 = (t37 + 4);
    t52 = *((unsigned int *)t51);
    t53 = (!(t52));
    t54 = (t38 + 4);
    t55 = *((unsigned int *)t54);
    t56 = (!(t55));
    t57 = (t53 && t56);
    t58 = (t39 + 4);
    t59 = *((unsigned int *)t58);
    t60 = (!(t59));
    t61 = (t57 && t60);
    if (t61 == 1)
        goto LAB18;

LAB19:    xsi_set_current_line(55, ng0);
    t2 = (t0 + 2704);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = ((char*)((ng7)));
    memset(t13, 0, 8);
    xsi_vlog_signed_add(t13, 32, t4, 32, t5, 32);
    t11 = (t0 + 2704);
    xsi_vlogvar_assign_value(t11, t13, 0, 0, 32);
    goto LAB14;

LAB18:    t62 = *((unsigned int *)t39);
    t63 = (t62 + 0);
    t64 = *((unsigned int *)t37);
    t65 = *((unsigned int *)t38);
    t66 = (t64 - t65);
    t67 = (t66 + 1);
    xsi_vlogvar_assign_value(t36, t16, t63, *((unsigned int *)t38), t67);
    goto LAB19;

}


extern void work_m_00000000001205104565_1163535770_init()
{
	static char *pe[] = {(void *)Initial_37_0,(void *)Always_45_1};
	xsi_register_didat("work_m_00000000001205104565_1163535770", "isim/SubBytes_VTF_isim_beh.exe.sim/work/m_00000000001205104565_1163535770.didat");
	xsi_register_executes(pe);
}
