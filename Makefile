CC = gcc
CFLAGS = -g -O0 
TIME = time

all: rundhrystone rundhrystoneR rundhrystoneO rundhrystoneRO

dhrystone: dhry_1.o dhry_2.o
	$(CC)  $(LDFLAGS) -o $@ dhry_1.o  dhry_2.o
dhry_1.o: dhry_1.c dhry.h
	$(CC) $(CFLAGS) -c dhry_1.c
dhry_2.o: dhry_2.c dhry.h
	$(CC) $(CFLAGS) -c dhry_2.c
clean:
	rm -f *.o dhrystone dhrystoneR dhrystoneO dhrystoneRO

rundhrystone: dhrystone
	@echo 'Running dhrystone (Level 1 optimization, without registers)'
	./dhrystone 5000000
	./dhrystone
	./dhrystone
	@echo


dhrystoneR: dhry_1.o dhry_2.o
	$(CC) $(CFLAGS) -DREG=register -o $@ dhry_1.o  dhry_2.o

rundhrystoneR: dhrystoneR
	@echo 'Running dhrystone (Level 1 optimization, with registers)'
	./dhrystoneR 5000000
	./dhrystoneR
	./dhrystoneR
	@echo


dhrystoneO: dhry_1.o dhry_2.o
	$(CC) $(CFLAGS) -O -o $@ dhry_1.o dhry_2.o

rundhrystoneO: dhrystoneO
	@echo 'Running dhrystone (Level 2 optimization, without registers)'
	./dhrystoneO 5000000
	./dhrystoneO
	./dhrystoneO
	@echo


dhrystoneRO: dhry_1.o dhry_2.o
	$(CC) $(CFLAGS) -O -DREG=register -o $@ dhry_1.o dhry_2.o

rundhrystoneRO: dhrystoneRO
	@echo 'Running dhrystone (Level 2 optimization, with registers)'
	./dhrystoneRO 5000000
	./dhrystoneRO
	./dhrystoneRO
	@echo


