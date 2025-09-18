CC=gcc
RM=rm -f
CFLAGS=-Wl,-rpath,/usr/lib -Wall -fPIC -O3 -std=gnu89
LDFLAGS=
LDLIBS=-lcupsimage -lcups

SRCS=rastertozj.c
OBJS=$(subst .c,.o,$(SRCS))

all: rastertozj

rastertozj: $(OBJS)
	gcc $(LDFLAGS) -o rastertozj rastertozj.o $(LDLIBS)

install: all
	mkdir -p ${DESTDIR}/usr/lib/cups/filter
	cp -f rastertozj ${DESTDIR}/usr/lib/cups/filter
	chmod 755 ${DESTDIR}/usr/lib/cups/filter
	mkdir -p ${DESTDIR}/usr/share/cups/model/zjiang
	cp cp ZJ-58.ppd ${DESTDIR}/usr/share/cups/model/zjiang/

rastertozj.o: rastertozj.c
	gcc $(CFLAGS) -c rastertozj.c

clean:
	rm -f rastertozj rastertozj.o
