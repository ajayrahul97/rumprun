/*-
 * Copyright (c) 2015 Antti Kantee.  All Rights Reserved.
 *
 *
 *        File: cpu_sched_switch.S
 *      Author: Ajay Rahul Pradeep
 *
 *        Date: April 2023
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS
 * OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */

#include <bmk-core/arm/asm.h>

ENTRY(bmk_cpu_sched_bouncer)
	// Pop the function and argument from the stack.
    mov  sp, x29
    ldp x0, x6, [sp], #16
    mov x30, lr
    br x6			// branch to the function address
    bl bmk_sched_exit		// call
END(bmk_cpu_sched_bouncer)


/*
 * x0 = previous thread
 * x1 = new thread
 */

ENTRY(bmk_cpu_sched_switch)
        stp x19, x20, [sp, #-16]!     // save non-scratch registers
        stp x21, x22, [sp, #-16]!
        stp x23, x24, [sp, #-16]!
        stp x25, x26, [sp, #-16]!
        stp x27, x28, [sp, #-16]!
        stp x29, x30, [sp, #-16]!     // save fp and lr
		mov x29, sp					  // save stack ptr in x29	
		str x29, [x0, #0]			  // Save SP and LR of the current thread
		ldr x29, [x1, #0]   		  // Load SP of the next thread
		mov sp, x29					  // load sp from x29	
		mov x19, x0     			  // Using temp register to save value of x0
		mov x20, x1

		adr x2, 1f                    // save pc
		str x2, [x19, #8]
		ldr x30, [x20, #8]            // restore pc
		br x30
1:
        ldp x29, x30, [sp], #16       // restore fp and lr
		ldp x27, x28, [sp], #16       // restore registers
        ldp x25, x26, [sp], #16
        ldp x23, x24, [sp], #16
        ldp x21, x22, [sp], #16
        ldp x19, x20, [sp], #16
        ret
END(bmk_cpu_sched_switch)
