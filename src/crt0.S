/*****************************************************************************
 *                                                                           *
 *                         Copyright (C) 2023 AdaCore                        *
 *                                                                           *
 *  GNAT is free software;  you can  redistribute it  and/or modify it under *
 *  terms of the  GNU General Public License as published  by the Free Soft- *
 *  ware  Foundation;  either version 3,  or (at your option) any later ver- *
 *  sion.  GNAT is distributed in the hope that it will be useful, but WITH- *
 *  OUT ANY WARRANTY;  without even the  implied warranty of MERCHANTABILITY *
 *  or FITNESS FOR A PARTICULAR PURPOSE.                                     *
 *                                                                           *
 *  As a special exception under Section 7 of GPL version 3, you are granted *
 *  additional permissions described in the GCC Runtime Library Exception,   *
 *  version 3.1, as published by the Free Software Foundation.               *
 *                                                                           *
 *  You should have received a copy of the GNU General Public License and    *
 *  a copy of the GCC Runtime Library Exception along with this program;     *
 *  see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see    *
 *  <http://www.gnu.org/licenses/>.                                          *
 *                                                                           *
 *****************************************************************************/

        /*********/
        /* .data */
        /*********/
         .section .data.argv
argv_str:
        .ascii  "main\0"

        .align 4
argv:
        .word argv_str
        .word 0

        /**********/
        /* _start */
        /**********/

        .section .start
        .globl _start
        .type _start,@function

_start:
.option push
.option norelax
        la gp, __global_pointer$
.option pop
        la sp, __stack_end



        /* Clear bss section */
        .type _startup_clear_bss,@function
_startup_clear_bss:
        la a0, __bss_start
        la a1, __bss_end
        bgeu a0, a1, 2f
1:
        sw zero, (a0)
        addi a0, a0, 4
        bltu a0, a1, 1b
2:
        .size _startup_clear_bss, . - _startup_clear_bss

	/* Clear .sram_bss */
	.type _startup_clear_sram_bss,@function
_startup_clear_sram_bss:
        la a0, __sram_bss_start
        la a1, __sram_bss_end
        bgeu a0, a1, 2f
1:
        sw zero, (a0)
        addi a0, a0, 4
        bltu a0, a1, 1b
2:
        .size _startup_clear_sram_bss, . - _startup_clear_sram_bss


	/* Clear .csr_bss */
	.type _startup_clear_csr_bss,@function
_startup_clear_csr_bss:
        la a0, __csr_bss_start
        la a1, __csr_bss_end
        bgeu a0, a1, 2f
1:
        sw zero, (a0)
        addi a0, a0, 4
        bltu a0, a1, 1b
2:
        .size _startup_clear_csr_bss, . - _startup_clear_csr_bss


        /* Call static constructors */
.weak __libc_init_array
        la t0, __libc_init_array
        beq t0, zero, .skip_libc_init
        jalr t0
.skip_libc_init:

        /* Call main, with argc, argv  */
        la a0, 1
        la a1, argv
        call main

        /* Save main's return value */
        mv t0, a0

        /* static destructors */
.weak __libc_fini_array
        la t0, __libc_fini_array
        beq t0, zero, .skip_libc_fini
        jalr t0
.skip_libc_fini:

        /* Restore main's return value */
        mv a0, t0

        call __gnat_exit
2:      j 2b


.global  trap_entry
trap_entry:
  sw x1,  - 1*4(sp)
  sw x5,  - 2*4(sp)
  sw x6,  - 3*4(sp)
  sw x7,  - 4*4(sp)
  sw x10, - 5*4(sp)
  sw x11, - 6*4(sp)
  sw x12, - 7*4(sp)
  sw x13, - 8*4(sp)
  sw x14, - 9*4(sp)
  sw x15, -10*4(sp)
  sw x16, -11*4(sp)
  sw x17, -12*4(sp)
  sw x28, -13*4(sp)
  sw x29, -14*4(sp)
  sw x30, -15*4(sp)
  sw x31, -16*4(sp)
  addi sp,sp,-16*4
  call isr
  lw x1 , 15*4(sp)
  lw x5,  14*4(sp)
  lw x6,  13*4(sp)
  lw x7,  12*4(sp)
  lw x10, 11*4(sp)
  lw x11, 10*4(sp)
  lw x12,  9*4(sp)
  lw x13,  8*4(sp)
  lw x14,  7*4(sp)
  lw x15,  6*4(sp)
  lw x16,  5*4(sp)
  lw x17,  4*4(sp)
  lw x28,  3*4(sp)
  lw x29,  2*4(sp)
  lw x30,  1*4(sp)
  lw x31,  0*4(sp)
  addi sp,sp,16*4
  mret




