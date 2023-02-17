ASMS=	arch/aarch64/integrator/locore.S

SRCS+=	arch/aarch64/integrator/machdep.c
SRCS+=	arch/aarch64/integrator/serialcons.c

CPPFLAGS+=	-Iarch/aarch64

.PHONY: archdirs
archdirs:
	mkdir -p ${RROBJ}/platform/arch/aarch64/integrator
