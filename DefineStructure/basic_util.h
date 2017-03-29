// **************************************************************************************************
// Grappolo: A C++ library for parallel graph community detection
// Hao Lu, Ananth Kalyanaraman (hao.lu@wsu.edu, ananth@eecs.wsu.edu) Washington State University
// Mahantesh Halappanavar (hala@pnnl.gov) Pacific Northwest National Laboratory
//
// For citation, please cite the following paper:
// Lu, Hao, Mahantesh Halappanavar, and Ananth Kalyanaraman. 
// "Parallel heuristics for scalable community detection." Parallel Computing 47 (2015): 19-37.
//
// **************************************************************************************************
// Copyright (c) 2016. Washington State University ("WSU"). All Rights Reserved.
// Permission to use, copy, modify, and distribute this software and its documentation
// for educational, research, and not-for-profit purposes, without fee, is hereby
// granted, provided that the above copyright notice, this paragraph and the following
// two paragraphs appear in all copies, modifications, and distributions. For
// commercial licensing opportunities, please contact The Office of Commercialization,
// WSU, 280/286 Lighty, PB Box 641060, Pullman, WA 99164, (509) 335-5526,
// commercialization@wsu.edu<mailto:commercialization@wsu.edu>, https://commercialization.wsu.edu/

// IN NO EVENT SHALL WSU BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL, INCIDENTAL,
// OR CONSEQUENTIAL DAMAGES, INCLUDING LOST PROFITS, ARISING OUT OF THE USE OF
// THIS SOFTWARE AND ITS DOCUMENTATION, EVEN IF WSU HAS BEEN ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.

// WSU SPECIFICALLY DISCLAIMS ANY WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE SOFTWARE AND
// ACCOMPANYING DOCUMENTATION, IF ANY, PROVIDED HEREUNDER IS PROVIDED "AS IS". WSU HAS NO
// OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
// **************************************************************************************************

#ifndef __UTILITLY__
#define __UTILITLY__

// Define in buildNextPhase.cpp
long renumberClustersContiguously(long *C, long size);
double buildNextLevelGraphOpt(graph *Gin, graph *Gout, long *C, long numUniqueClusters, int nThreads);
void buildNextLevelGraph(graph *Gin, graph *Gout, long *C, long numUniqueClusters);
long buildCommunityBasedOnVoltages(graph *G, long *Volts, long *C, long *Cvolts);
void segregateEdgesBasedOnVoltages(graph *G, long *Volts);
inline void Visit(long v, long myCommunity, short *Visited, long *Volts, 
				  long* vtxPtr, edge* vtxInd, long *C);
				  
// Define in vertexFollowing.cpp
long vertexFollowing(graph *G, long *C);
double buildNewGraphVF(graph *Gin, graph *Gout, long *C, long numUniqueClusters);

// Define in utilityFunctions.cpp
double computeGiniCoefficient(long *colorSize, int numColors);
void generateRandomNumbers(double *RandVec, long size);
void displayGraph(graph *G);
void duplicateGivenGraph(graph *Gin, graph *Gout);
void displayGraphEdgeList(graph *G);
void writeEdgeListToFile(graph *G, FILE* out);
void displayGraphCharacteristics(graph *G);


#endif
