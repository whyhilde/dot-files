include config.mk


SRC = slock.c explicit_bzero.c
OBJ = ${SRC:.c=.o}
HEADERS = arg.h config.h util.h


all: slock


.c.o:
	${CC} -c ${CFLAGS} $<


${OBJ}: config.mk ${HEADERS}


slock: ${OBJ}
	${CC} -o $@ ${OBJ} ${LDFLAGS}


dist:
	mkdir -p slock-${VERSION}
	cp -R Makefile slock.1 config.mk ${SRC} ${HEADERS} slock-${VERSION}
	tar -cf slock-${VERSION}.tar slock-${VERSION}
	gzip slock-${VERSION}.tar
	rm -rf slock-${VERSION}


install: all
	mkdir -p ${DESTDIR}${PREFIX}
	cp -f slock ${DESTDIR}${PREFIX}
	chmod 755 ${DESTDIR}${PREFIX}/slock
	chmod u+s ${DESTDIR}${PREFIX}/slock
	mkdir -p ${DESTDIR}${MANPREFIX}/man1
	sed "s/VERSION/${VERSION}/g" <slock.1 >${DESTDIR}${MANPREFIX}/man1/slock.1
	chmod 644 ${DESTDIR}${MANPREFIX}/man1/slock.1
	rm slock ${OBJ}


uninstall:
	rm -f ${DESTDIR}${PREFIX}/slock
	rm -f ${DESTDIR}${MANPREFIX}/man1/slock.1


.PHONY: all dist install uninstall
