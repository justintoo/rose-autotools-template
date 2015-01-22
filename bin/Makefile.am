# Project header files should be included in this relative form:
#
#     #include <project/header.h>
#
AM_CPPFLAGS = -I$(top_srcdir)/lib

AM_LDFLAGS = \
		$(top_builddir)/lib/project/libproject.la

LDADD = \
		$(top_builddir)/lib/project/libproject.la

#
# libproject.la
#
$(top_builddir)/lib/project/libproject.la:
	$(MAKE) -C $(top_builddir)/lib/project/


bin_PROGRAMS = main
main_SOURCES = main.cpp
main_LDADD = $(top_builddir)/lib/project/libproject.la

