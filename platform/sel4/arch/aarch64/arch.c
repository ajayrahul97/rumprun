/*
 * Copyright 2018, Data61
 * Commonwealth Scientific and Industrial Research Organisation (CSIRO)
 * ABN 41 687 119 230.
 *
 * This software may be distributed and modified according to the terms of
 * the BSD 2-Clause license. Note that NO WARRANTY is provided.
 * See "LICENSE_BSD2.txt" for details.
 *
 * @TAG(DATA61_BSD)
 */

#include <rumprun/init_data.h>
#include <sel4/helpers.h>
#include <bmk-core/sched.h>

void
arch_init_simple(simple_t *simple)
{
    simple->arch_simple.data = (void *) simple->data;
}