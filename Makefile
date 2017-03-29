#GCC Compilers:
CC  = gcc
CPP = g++
CFLAGS   = -Ofast -fopenmp -std=c99 
CPPFLAGS = -Ofast -fopenmp -std=c++0x


LDFLAGS  = $(CPPFLAGS)
#INCLUDES = . $(METIS_INCLUDE)
INCLUDES = ./DefineStructure/
IOFOLDER = ./InputsOutput
COFOLDER = ./BasicCommunitiesDetection
UTFOLDER = ./Utility
CLFOLDER = ./Coloring
FSFOLDER = ./FullSyncOptimization
LIBS     = -lm


TARGET_1 = convertFileToBinary
TARGET_2 = driverForGraphClustering
TARGET_3 = driverForColoring

TARGET   = $(TARGET_1) $(TARGET_2) $(TARGET_3)
# $(TARGET_4) $(TARGET_5) $(TARGET_6)

#TARGET = $(TARGET_1) $(TARGET_2) $(TARGET_3) $(TARGET_4)

#TARGET = $(TARGET_9)


#IOBJECTS = loadBinary.o loadMetis.o loadMatrixMarket.o \
          loadEdgeList.o 
IOFILES = $(wildcard $(IOFOLDER)/*.cpp)
IOOBJECTS = $(addprefix $(IOFOLDER)/,$(notdir $(IOFILES:.cpp=.o)))

COFILES = $(wildcard $(COFOLDER)/*.cpp)
COOBJECTS = $(addprefix $(COFOLDER)/,$(notdir $(COFILES:.cpp=.o)))

UTFILES = $(wildcard $(UTFOLDER)/*.cpp)
UTOBJECTS = $(addprefix $(UTFOLDER)/,$(notdir $(UTFILES:.cpp=.o)))

CLFILES = $(wildcard $(CLFOLDER)/*.cpp)
CLOBJECTS = $(addprefix $(CLFOLDER)/,$(notdir $(CLFILES:.cpp=.o)))

CLFILES2 = coloringDistanceOne.o equitableColoringDistanceOne.o coloringUtils.cpp
CLOBJECTS2 = $(addprefix $(CLFOLDER)/,$(notdir $(CLFILES2:.cpp=.o)))
 
FSFILES = $(wildcard $(FSFOLDER)/*.cpp)
FSOBJECTS = $(addprefix $(FSFOLDER)/,$(notdir $(FSFILES:.cpp=.o)))



#OBJECTS  = RngStream.o utilityFunctions.o parseInputFiles.o \
           writeGraphDimacsFormat.o buildNextPhase.o \
           coloringDistanceOne.o utilityClusteringFunctions.o equitableColoringDistanceOne.o\
           parallelLouvainMethod.o parallelLouvainMethodNoMap.o \
           parallelLouvainMethodScale.o parallelLouvainWithColoring.o parallelLouvainWithColoringNoMap.o \
	   louvainMultiPhaseRun.o parseInputParameters.o vertexFollowing.o

all: $(TARGET) 
coloring: $(TARGET_3)

#message

$(TARGET_1): $(IOOBJECTS) $(UTOBJECTS) $(TARGET_1).o
	$(CPP) $(LDFLAGS) -o ./bin/$(TARGET_1) $(UTOBJECTS) $(IOOBJECTS) $(TARGET_1).o

$(TARGET_3): $(IOOBJECTS) $(CLOBJECTS2) $(UTOBJECTS) $(TARGET_3).o
	$(CPP) $(LDFLAGS) -o ./bin/$(TARGET_3) $(IOOBJECTS) $(UTOBJECTS) $(CLOBJECTS2) $(TARGET_3).o

$(TARGET_2): $(IOOBJECTS) $(COOBJECTS) $(UTOBJECTS) $(FSOBJECTS) $(CLOBJECTS) $(TARGET_2).o
	$(CPP) $(LDFLAGS) -o ./bin/$(TARGET_2) $(TARGET_2).o $(FSOBJECTS) $(IOOBJECTS) $(COOBJECTS) $(UTOBJECTS) $(CLOBJECTS) $(LIBS)


.c.o:
	$(CC) $(CFLAGS) -c $< -I$(INCLUDES) -o $@

.cpp.o:
	$(CPP) $(CPPFLAGS) -c $< -I$(INCLUDES) -o $@

$(IOFOLDER)/%.o: $(IOFOLDER)/%.cpp
	$(CPP) $(CPPFLAGS) -c $< -I$(INCLUDES) -o $@

$(COFOLDER)/%.o: $(COFOLDER)/%.cpp
	$(CPP) $(CPPFLAGS) -c $< -I$(INCLUDES) -o $@

$(UTFOLDER)/%.o: $(UTFOLDER)/%.cpp
	$(CPP) $(CPPFLAGS) -c $< -I$(INCLUDES) -o $@


clean:
	rm -f $(TARGET_1).o $(TARGET_2).o $(TARGET_3).o $(FSFOLDER)/*.o $(IOFOLDER)/*.o $(COFOLDER)/*.o $(UTFOLDER)/*.o $(CLFOLDER)/*.o ./bin/*

#wipe:
#	rm -f $(TARGET).o $(OBJECTS) $(TARGET) *~ *.bak

message:
	echo "Executables: " $(TARGET) " have been created"

print-%: ; @echo $*=$($*)
