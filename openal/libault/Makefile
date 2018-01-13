##########################################################
# Copyright 2016-2080 evilbinary.
#作者:evilbinary on 12/24/16.
#邮箱:rootdebug@163.com
##########################################################

ROOT := $(shell pwd)
SRC := $(ROOT)
TARGET = libalut.so

UNAME_S := $(shell uname -s)
OS_NAME := $(shell echo $(UNAME_S) | tr '[A-Z]' '[a-z]')

ifeq (NT, $(findstring NT,$(UNAME_S)))
   TARGET = libalut.dll
endif

all: $(TARGET)
	@echo Build complete for $(TARGET)

$(TARGET):$(OS_NAME)
	$(MAKE) -C libalut
	cp libalut/$(TARGET) ../$(TARGET)

$(OS_NAME):
ifeq (NT, $(findstring NT,$(UNAME_S)))
	cp libalut/libopenal-1.dll ../libopenal-1.dll
	cp libalut/libgcc_s_dw2-1.dll ../libgcc_s_dw2-1.dll
	cp libalut/libwinpthread-1.dll ../libwinpthread-1.dll
else
	@echo you should install libalut-dev libopenal-dev first!!!
endif
	@echo link... $(OS_NAME) $(LN_SRC)
ifeq (,$(wildcard boot))
	@ln -sf platform/$(OS_NAME)/libscm libscm
	@ln -sf platform/$(OS_NAME)/3rdparty 3rdparty
endif

clean:
	$(MAKE) -C libalut clean
	rm -rf libscm 3rdparty