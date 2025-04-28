#pragma once

#ifdef __cplusplus
extern "C" {
#endif

typedef struct __tag_FooStruct {
  unsigned int u32PixelFormat;
  int iWidth;
  int iHeight;
  unsigned char* pPlane[4];
  int pPitch[4];
} FooStruct, *LPFooStruct;

#ifdef __cplusplus
}
#endif