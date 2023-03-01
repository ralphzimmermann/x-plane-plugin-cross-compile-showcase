BUILDDIR        :=      ./build
TARGET          := X-Plane-Menu-SDK-Sample

SOURCES = \
        X-Plane-Menu-SDK-Sample.cpp

all: linux mac windows

linux:
	make -f Makefile.platform linux TARGET=$(TARGET) SOURCES=$(SOURCES)

windows:
	make -f Makefile.platform windows TARGET=$(TARGET) SOURCES=$(SOURCES)

mac:
	make -f Makefile.platform mac_apple TARGET=$(TARGET) SOURCES=$(SOURCES)
	make -f Makefile.platform mac_intel TARGET=$(TARGET) SOURCES=$(SOURCES)
	lipo -create -output $(BUILDDIR)/$(TARGET)/64/mac.xpl $(BUILDDIR)/x86_64-macos/mac.xpl $(BUILDDIR)/aarch64-macos/mac.xpl

clean:
	@echo Cleaning out everything.
	rm -rf $(BUILDDIR)



