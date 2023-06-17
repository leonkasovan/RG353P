CC := g++
CFLAGS := -Wall -I/usr/include/libdrm
#CFLAGS := -std=c++11 -Wall -I/usr/include/libdrm
LDFLAGS := -lEGL -lGLESv2 -ldrm -lgbm

#SOURCES := test_egl.cpp
SOURCES := test_egl.c
EXECUTABLE := test_egl

all: $(EXECUTABLE)

$(EXECUTABLE): $(SOURCES)
	$(CC) $(CFLAGS) $(SOURCES) -o $(EXECUTABLE) $(LDFLAGS)

clean:
	rm -f $(EXECUTABLE)
