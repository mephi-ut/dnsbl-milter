# $Id$
#
# Copyright 2007, 2008, 2009 Haw Loeung <hloeung@users.sourceforge.net>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

WARN     = -Wall -Wextra -Wpointer-arith -Wstrict-prototypes -O2
LIBS     = -lmilter -lpthread
PROGNAME = dnsbl-milter

INSTPATH = /usr/local/sbin/

INCDIRS  = -I/usr/include/libmilter/
LIBDIRS  = -L/usr/lib/ -L/usr/lib/libmilter/

default all: main

main: dnsbl-milter.c
	$(CC) $(WARN) $(CFLAGS) -D_REENTRANT dnsbl-milter.c -o $(PROGNAME) $(LIBS) $(INCDIRS) $(LIBDIRS)

install: dnsbl-milter
	[[ -e "$(INSTPATH)/$(PROGNAME)" ]] && cp -af "$(INSTPATH)/$(PROGNAME)" "$(INSTPATH)/$(PROGNAME).bak" || true
	install -m 755 -D $(PROGNAME) $(INSTPATH)/$(PROGNAME)
	strip $(INSTPATH)/$(PROGNAME)

clean:
	[[ -e "$(PROGNAME)" ]] && rm -f $(PROGNAME)
