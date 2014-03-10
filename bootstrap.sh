#!/bin/bash -x

# Note: In the case that Autotools is not defined in the system default
# location, e.g. `/opt/local`, `ACLOCAL_PATH` may be used to point to
# `libtool.m4`, for example.
ACLOCAL_PATH="${LIBTOOL_HOME}/share/aclocal" \
    autoreconf --force --install --verbose
if [ $? -ne 0 ]; then
  echo "[FATAL] Failed to perform the Autotools bootstrapping. Aborting..."
  exit 1
else
cat <<-EOF
[INFO] Successfully performed the Autotools bootstrapping.
[INFO]
[INFO] Now run PROJECT/configure in a separate compilation directory
[INFO] to generate your project's Makefiles.
[INFO]
EOF
  exit 0
fi


# Example Output:
#
#     ```bash
#     $ ACLOCAL_PATH="${LIBTOOL_HOME}/share/aclocal" autoreconf --force --install --verbose
#     autoreconf: Entering directory `.'
#     autoreconf: configure.ac: not using Gettext
#     autoreconf: running: aclocal --force -I m4
#     autoreconf: configure.ac: tracing
#     autoreconf: running: libtoolize --copy --force
#     libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, `build-aux'.
#     libtoolize: copying file `build-aux/ltmain.sh'
#     libtoolize: putting macros in AC_CONFIG_MACRO_DIR, `m4'.
#     libtoolize: copying file `m4/libtool.m4'
#     libtoolize: copying file `m4/ltoptions.m4'
#     libtoolize: copying file `m4/ltsugar.m4'
#     libtoolize: copying file `m4/ltversion.m4'
#     libtoolize: copying file `m4/lt~obsolete.m4'
#     autoreconf: running: /nfs/casc/overture/ROSE/opt/rhel6/x86_64/autoconf/2.69/gcc/4.4.5/bin/autoconf --force
#     autoreconf: running: /nfs/casc/overture/ROSE/opt/rhel6/x86_64/autoconf/2.69/gcc/4.4.5/bin/autoheader --force
#     autoreconf: running: automake --add-missing --copy --force-missing
#     autoreconf: Leaving directory `.'
#     ```
