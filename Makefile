PGFILEDESC = "pg_catcheck - system catalog integrity checker"
PGAPPICON = win32

PROGRAM = pg_catcheck
OBJS	= pg_catcheck.o check_attribute.o check_class.o check_depend.o \
			check_oids.o compat.o definitions.o log.o pgrhash.o fls.o

PG_CPPFLAGS = -I$(libpq_srcdir)
PG_LIBS = -L$(LD_LIBRARY_PATH) $(libpq_pgport) $(PTHREAD_LIBS)

PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)

ifneq ($(PORTNAME), win32)
override CFLAGS += $(PTHREAD_CFLAGS)
endif
