cdef extern from "../foo_sdk/foo_def.h":  # 对应头文件名
    ctypedef struct FooStruct:
        unsigned int u32PixelFormat     # 对应 unsigned int
        int iWidth                      # 对应 int
        int iHeight                     # 对应 int
        unsigned char* pPlane[4]        # 对应 unsigned char* 的固定大小数组
        int pPitch[4]                   # 对应 int 的固定大小数组

    ctypedef FooStruct* LPFooStruct     # 定义指针类型 LFPooStruct

cdef extern from "../foo_sdk/foo_c_api.h":
    long FooDummyPrint(const FooStruct* pFooStruct)  # 声明 FooDummyPrint 函数


