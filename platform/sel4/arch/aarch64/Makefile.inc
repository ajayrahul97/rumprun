#
# Copyright 2018, Data61
# Commonwealth Scientific and Industrial Research Organisation (CSIRO)
# ABN 41 687 119 230.
#
# This software may be distributed and modified according to the terms of
# the BSD 2-Clause license. Note that NO WARRANTY is provided.
# See "LICENSE_BSD2.txt" for details.
#
# @TAG(DATA61_BSD)
#

SRCS+=	arch/aarch64/clock.c arch/aarch64/arch.c

${RROBJ}/platform/archdirs.stamp:
	$(Q)mkdir -p ${RROBJ}/platform/arch/aarch64
	$(Q)touch $@
