# Project header files should be included in this relative form:
#
#     #include <project/header.h>
#
AM_CPPFLAGS = -I$(top_srcdir)/lib
AM_CXXFLAGS = $(WARN_CXXFLAGS)

lib_LTLIBRARIES = libproject.la

libproject_la_SOURCES = \
	func.cpp

include_HEADERS = \
	config.h \
	func.h

