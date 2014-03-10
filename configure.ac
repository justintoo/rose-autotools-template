#
#    _____           _           _     ____
#   |  __ \         (_)         | |   |  _ \
#   | |__) | __ ___  _  ___  ___| |_  | |_) | __ _ _ __  _ __   ___ _ __
#   |  ___/ '__/ _ \| |/ _ \/ __| __| |  _ < / _` | '_ \| '_ \ / _ \ '__|
#   | |   | | | (_) | |  __/ (__| |_  | |_) | (_| | | | | | | |  __/ |
#   |_|   |_|  \___/| |\___|\___|\__| |____/ \__,_|_| |_|_| |_|\___|_|
#                  _/ |
#                 |__/
#
# http://www.network-science.de/ascii/


AC_PREREQ([2.69])
AC_INIT([PROJECT_NAME], [0.0.0], [AUTHOR@EMAIL.COM])

#-------------------------------------------------------------------------------
# AC_CONFIG_SRCDIR (unique-file-in-source-dir)
#-------------------------------------------------------------------------------
# unique-file-in-source-dir is some file that is in the package's source
# directory; configure checks for this file's existence to make sure that
# the directory that it is told contains the source code in fact does.
# Occasionally people accidentally specify the wrong directory with --srcdir;
# this is a safety check.
#
# [http://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.69/html_node/Input.html]
#-------------------------------------------------------------------------------
AC_CONFIG_SRCDIR([src/project/func.h])

#-------------------------------------------------------------------------------
# AC_CONFIG_MACRO_DIR (dir)
#-------------------------------------------------------------------------------
# Specify dir as the location of additional local Autoconf macros.
#
# [http://www.gnu.org/savannah-checkouts/gnu/autoconf/manual/autoconf-2.69/html_node/Input.html]
#-------------------------------------------------------------------------------
AC_CONFIG_MACRO_DIR([m4])

#-------------------------------------------------------------------------------
# AC_CONFIG_HEADERS (header ..., [cmds], [init-cmds])
#-------------------------------------------------------------------------------
# This macro is one of the instantiating macros... Make AC_OUTPUT create the
# file(s) in the blank-or-newline-separated list header containing C preprocessor
# #define statements, and replace ‘@DEFS@’ in generated files with -DHAVE_CONFIG_H
# instead of the value of DEFS. The usual name for header is config.h.
#
# [https://www.gnu.org/software/autoconf/manual/autoconf-2.65/html_node/Configuration-Headers.html]
#-------------------------------------------------------------------------------
AC_CONFIG_HEADERS([src/project/config.h])

#-------------------------------------------------------------------------------
# AC_CONFIG_AUX_DIR
#-------------------------------------------------------------------------------
# Automake will look for various helper scripts, such as install-sh, in the
# directory named in this macro invocation.
#
# [http://www.gnu.org/software/automake/manual/html_node/Optional.html]
#-------------------------------------------------------------------------------
AC_CONFIG_AUX_DIR([build-aux])

#-------------------------------------------------------------------------------
# AM_INIT_AUTOMAKE([OPTIONS])
#-------------------------------------------------------------------------------
# Runs many macros required for proper operation of the generated Makefiles.
#
# Today, AM_INIT_AUTOMAKE is called with a single argument: a space-separated
# list of Automake options that should be applied to every Makefile.am in the tree.
#
# [http://www.gnu.org/software/automake/manual/html_node/Public-Macros.html]
#
# ## foreign
# The foreign option tells Automake that this package will not follow the GNU
# Standards. GNU packages should always distribute additional files such as
# ChangeLog, AUTHORS, etc. We do not want automake to complain about these
# missing files in our small example.
#
# [http://www.gnu.org/software/automake/manual/automake.html]
#
# ## subdir-objects
# By default the output file (on Unix systems, the .o file) will be put into
# the current build directory. However, if the option subdir-objects is in
# effect in the current directory then the .o file will be put into the
# subdirectory named after the source file. For instance, with subdir-objects
# enabled, sub/dir/file.c will be compiled to sub/dir/file.o.
#
# [http://www.gnu.org/software/automake/manual/automake.html]
#
#-------------------------------------------------------------------------------
AM_INIT_AUTOMAKE([foreign subdir-objects])

# Use the builtin verbose mechanism of Automake:
#
#         ```bash
#         $ make V=0
#         $ make V=1
#         ```
#
# We put this in an ifdef for backward compatibility since this
# macro (AM_SILENT_RULES) is only supported for Automake v1.11+.
#
m4_ifdef([AM_SILENT_RULES], [AM_SILENT_RULES([yes])])

#-------------------------------------------------------------------------------
# LT_INIT
# AC_PROG_LIBTOOL
# AM_PROG_LIBTOOL
#-------------------------------------------------------------------------------
# Add support for the --enable-shared, --disable-shared, --enable-static,
# --disable-static, --with-pic, and --without-pic configure flags.1 AC_PROG_LIBTOOL
# and AM_PROG_LIBTOOL are deprecated names for older versions of this macro;
# autoupdate will upgrade your configure.ac files.
#
# [http://www.gnu.org/software/libtool/manual/html_node/LT_005fINIT.html]
#-------------------------------------------------------------------------------
LT_INIT
LT_PREREQ([2.4])

#-------------------------------------------------------------------------------
# Checks for programs.
#-------------------------------------------------------------------------------
AC_PROG_CC
AC_PROG_CXX
AC_LANG([C],[C++])

#-------------------------------------------------------------------------------
# Check for C++11
#-------------------------------------------------------------------------------
AC_LANG_PUSH([C++])
AX_CXX_COMPILE_STDCXX_11([noext])
AC_LANG_POP([C++])

#-------------------------------------------------------------------------------
# GCC specific configuration (optional)
#-------------------------------------------------------------------------------
GCC_WARN_CXXFLAGS="-fdiagnostics-color=auto -Wall -Wextra -Wpedantic -Wfatal-errors"
GCC_WARN_CXXFLAGS_EXTRA="-Wcast-align -Wcast-qual -Wformat -Wpointer-arith -Wwrite-strings"
GCC_DEBUG_CXXFLAGS="-g -O0 -fno-omit-frame-pointer -fno-inline"

#-------------------------------------------------------------------------------
# CLI OPTIONS
#
#     _____ _      _____      ____        _   _
#    / ____| |    |_   _|    / __ \      | | (_)
#   | |    | |      | |     | |  | |_ __ | |_ _  ___  _ __  ___
#   | |    | |      | |     | |  | | '_ \| __| |/ _ \| '_ \/ __|
#   | |____| |____ _| |_    | |__| | |_) | |_| | (_) | | | \__ \
#    \_____|______|_____|    \____/| .__/ \__|_|\___/|_| |_|___/
#                                  | |
#                                  |_|
#
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# --enable-gcc-warnings
#
#   Check for GCC warning flags (optional)
#-------------------------------------------------------------------------------
AC_MSG_CHECKING([whether to enable the GCC warnings])
AC_ARG_ENABLE([gcc-warnings],
    [AS_HELP_STRING([--enable-gcc-warnings],
                    [turn on lots of GCC warnings (for developers)])],
    [case "$enableval" in
        yes|no) ;;
        *)      AC_MSG_ERROR([bad value ${enableval} for gcc-warnings option]) ;;
    esac
    gcc_warnings=$enableval],
    [gcc_warnings=no]
)
AC_MSG_RESULT([$gcc_warnings])
if test "$gcc_warnings" = yes; then
    AC_SUBST([WARN_CXXFLAGS],"$GCC_WARN_CXXFLAGS $GCC_WARN_CXXFLAGS_EXTRA")
fi

#-------------------------------------------------------------------------------
# --enable-gcc-debug
#
#   Check for GCC debug flags (optional)
#-------------------------------------------------------------------------------
AC_MSG_CHECKING([whether to enable the GCC debug build])
AC_ARG_ENABLE([gcc-debug],
    [AS_HELP_STRING([--enable-gcc-debug],
                    [turn on GCC debug flags (for developers)])],
    [case "$enableval" in
        yes|no) ;;
        *)      AC_MSG_ERROR([bad value ${enableval} for gcc-debug option]) ;;
    esac
    gcc_debug=$enableval],
    [gcc_debug=no]
)
AC_MSG_RESULT([$gcc_debug])
if test "$gcc_debug" = yes; then
    AC_SUBST([CXXFLAGS],"$GCC_DEBUG_CXXFLAGS")
    AC_DEFINE([DEBUG],[],[Debug Mode])
else
    AC_DEFINE([NDEBUG],[],[Release Mode])
fi

#-------------------------------------------------------------------------------
# Configure pthreads.
#-------------------------------------------------------------------------------
ACX_PTHREAD([have_pthread=yes])

#-------------------------------------------------------------------------------
# TEST HARNESS
#   _______ ______  _____ _______
#  |__   __|  ____|/ ____|__   __|
#     | |  | |__  | (___    | |
#     | |  |  __|  \___ \   | |
#     | |  | |____ ____) |  | |
#     |_|  |______|_____/   |_|
#
#
#   _    _          _____  _   _ ______  _____ _____
#  | |  | |   /\   |  __ \| \ | |  ____|/ ____/ ____|
#  | |__| |  /  \  | |__) |  \| | |__  | (___| (___
#  |  __  | / /\ \ |  _  /| . ` |  __|  \___ \\___ \
#  | |  | |/ ____ \| | \ \| |\  | |____ ____) |___) |
#  |_|  |_/_/    \_\_|  \_\_| \_|______|_____/_____/
#
#
#-------------------------------------------------------------------------------
GTEST_VERSION="1.7.0"
if test "x$have_pthread" = "xyes"; then
  GTEST_CPPFLAGS="-DGTEST_HAS_PTHREAD=1"
  GTEST_CXXFLAGS="$PTHREAD_CFLAGS"
  GTEST_LDFLAGS=
  GTEST_LIBS="$PTHREAD_LIBS"
else
  GTEST_CPPFLAGS="-DGTEST_HAS_PTHREAD=0"
  GTEST_CXXFLAGS=
  GTEST_LDFLAGS=
  GTEST_LIBS=
fi
AC_SUBST([GTEST_VERSION])
AC_SUBST([GTEST_CPPFLAGS])
AC_SUBST([GTEST_CXXFLAGS])
AC_SUBST([GTEST_LDFLAGS])
AC_SUBST([GTEST_LIBS])

#-------------------------------------------------------------------------------
# Checks for libraries.
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# Checks for header files.
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# Checks for typedefs, structures, and compiler characteristics.
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
# Checks for library functions.
#-------------------------------------------------------------------------------

#-------------------------------------------------------------------------------
AC_CONFIG_FILES([Makefile
                 lib/Makefile
                 lib/gtest/Makefile
                 src/Makefile
                 src/project/Makefile
                 tests/Makefile
                 ])
AC_OUTPUT

#-------------------------------------------------------------------------------
#    _____ _    _ __  __ __  __          _______     __
#   / ____| |  | |  \/  |  \/  |   /\   |  __ \ \   / /
#  | (___ | |  | | \  / | \  / |  /  \  | |__) \ \_/ /
#   \___ \| |  | | |\/| | |\/| | / /\ \ |  _  / \   /
#   ____) | |__| | |  | | |  | |/ ____ \| | \ \  | |
#  |_____/ \____/|_|  |_|_|  |_/_/    \_\_|  \_\ |_|
#
#-------------------------------------------------------------------------------
AC_MSG_RESULT([
minimal-gtest-autotools $VERSION is now configured
Configure Information:
  C Compiler        : $CC
    DEFS            :   $DEFS
    CPPFLAGS        :   $CPPFLAGS
    CFLAGS          :   $CFLAGS

  C++ Compiler      : $CXX
    DEFS            :   $DEFS
    CPPFLAGS        :   $CPPFLAGS
    CXXFLAGS        :   $CXXFLAGS

  Linker            : $LD
    LDFLAGS         :   $LDFLAGS
    LIBS            :   $LIBS

  Google Test
    GTEST_CPPFLAGS  : $GTEST_CPPFLAGS
    GTEST_CXXFLAGS  : $GTEST_CXXFLAGS
    GTEST_LDFLAGS   : $GTEST_LDFLAGS
    GTEST_LIBS      : $GTEST_LIBS

Success. Now run 'make' to compile the project.
])


#    _______ _    _ ______   ______ _   _ _____
#   |__   __| |  | |  ____| |  ____| \ | |  __ \
#      | |  | |__| | |__    | |__  |  \| | |  | |
#      | |  |  __  |  __|   |  __| | . ` | |  | |
#      | |  | |  | | |____  | |____| |\  | |__| |
#      |_|  |_|  |_|______| |______|_| \_|_____/

