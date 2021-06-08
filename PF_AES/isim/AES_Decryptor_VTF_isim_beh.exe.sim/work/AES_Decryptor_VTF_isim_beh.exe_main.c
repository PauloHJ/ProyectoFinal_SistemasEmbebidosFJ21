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

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000003351450373_4120261812_init();
    work_m_00000000001161093795_0417390455_init();
    work_m_00000000001338240787_1410076829_init();
    work_m_00000000002592232157_1590192449_init();
    work_m_00000000001349857595_2968439556_init();
    work_m_00000000003784242986_1360924128_init();
    work_m_00000000001174876447_0787762425_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001174876447_0787762425");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
