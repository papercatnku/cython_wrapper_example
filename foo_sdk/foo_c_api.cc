#include "foo_c_api.h"

#include <cstdio>
#include <iostream>
#include <sstream>
#include <string>

#include "foo_def.h"

using namespace std;
long FooDummyPrint(const FooStruct* pFooStruct) {
  if (pFooStruct == nullptr) {
    return 1;
  }
  stringstream ss;
  ss << "FooStruct:" << endl;
  ss << "  u32PixelFormat: " << pFooStruct->u32PixelFormat << endl;
  ss << "  iWidth: " << pFooStruct->iWidth << endl;
  ss << "  iHeight: " << pFooStruct->iHeight << endl;

  for (int i : {0, 1, 2, 3}) {
    ss << "  pPlane[" << i << "]: ";
    if (pFooStruct->pPlane[i] != nullptr) {
      size_t firstline2print = pFooStruct->iWidth < 4 ? pFooStruct->iWidth : 4;
      ss << "[";
      for (size_t j = 0; j < firstline2print - 1; j++) {
        ss << pFooStruct->pPlane[i][j] << ", ";
      }
    }
    ss << "\n  pPitch[" << i << "]: " << pFooStruct->pPitch[i] << endl;
  }
  printf("%s\n", ss.str().c_str());

  return 0;
}
