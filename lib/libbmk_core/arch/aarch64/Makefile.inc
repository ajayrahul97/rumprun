MYDIR:=	${.PARSEDIR}
.PATH:	${MYDIR}

# __aeabi_read_tp.S has been removed from srcs
# TODO : add it back for hw support

SRCS+=	cpu_sched_switch.S
SRCS+=	cpu_sched.c
