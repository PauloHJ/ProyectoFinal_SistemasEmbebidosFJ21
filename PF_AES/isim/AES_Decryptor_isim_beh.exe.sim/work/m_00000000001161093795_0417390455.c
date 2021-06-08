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
static const char *ng0 = "L:/ProyectoFinal_SistemasEmbebidosFJ21/PF_AES/AddRoundKeyDecryptor.v";
static int ng1[] = {1, 0};
static int ng2[] = {0, 0};



static void Always_31_0(char *t0)
{
    char t14[32];
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
    char *t13;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    unsigned int t26;
    char *t27;
    unsigned int t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;

LAB0:    t1 = (t0 + 3008U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(31, ng0);
    t2 = (t0 + 3328);
    *((int *)t2) = 1;
    t3 = (t0 + 3040);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(32, ng0);

LAB5:    xsi_set_current_line(40, ng0);
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

LAB7:    xsi_set_current_line(46, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);

LAB8:    goto LAB2;

LAB6:    xsi_set_current_line(41, ng0);

LAB9:    xsi_set_current_line(42, ng0);
    t11 = (t0 + 1528U);
    t12 = *((char **)t11);
    t11 = (t0 + 1368U);
    t13 = *((char **)t11);
    t15 = 0;

LAB13:    t16 = (t15 < 4);
    if (t16 == 1)
        goto LAB14;

LAB15:    t37 = (t0 + 2088);
    xsi_vlogvar_assign_value(t37, t14, 0, 0, 128);
    xsi_set_current_line(43, ng0);
    t2 = ((char*)((ng1)));
    t3 = (t0 + 1928);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    goto LAB8;

LAB10:    t35 = *((unsigned int *)t19);
    t36 = *((unsigned int *)t29);
    *((unsigned int *)t19) = (t35 | t36);

LAB12:    t15 = (t15 + 1);
    goto LAB13;

LAB11:    goto LAB12;

LAB14:    t17 = (t15 * 8);
    t11 = (t12 + t17);
    t18 = (t13 + t17);
    t19 = (t14 + t17);
    t20 = *((unsigned int *)t11);
    t21 = *((unsigned int *)t18);
    t22 = (t20 ^ t21);
    *((unsigned int *)t19) = t22;
    t23 = (t15 * 8);
    t24 = (t23 + 4);
    t25 = (t12 + t24);
    t26 = (t23 + 4);
    t27 = (t13 + t26);
    t28 = (t23 + 4);
    t29 = (t14 + t28);
    t30 = *((unsigned int *)t25);
    t31 = *((unsigned int *)t27);
    t32 = (t30 | t31);
    *((unsigned int *)t29) = t32;
    t33 = *((unsigned int *)t29);
    t34 = (t33 != 0);
    if (t34 == 1)
        goto LAB10;
    else
        goto LAB11;

}


extern void work_m_00000000001161093795_0417390455_init()
{
	static char *pe[] = {(void *)Always_31_0};
	xsi_register_didat("work_m_00000000001161093795_0417390455", "isim/AES_Decryptor_isim_beh.exe.sim/work/m_00000000001161093795_0417390455.didat");
	xsi_register_executes(pe);
}
