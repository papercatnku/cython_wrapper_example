from foo cimport FooStruct, LPFooStruct, FooDummyPrint  # 引入 pxd 文件中的声明
from libc.string cimport memset  # 导入 memset 用于初始化结构体
cdef class PyFooStruct:
    """
    Python 封装的 FooStruct 结构体
    """
    cdef FooStruct foo  # 定义一个 C 的 FooStruct 实例

    def __init__(self, unsigned int u32PixelFormat, int iWidth, int iHeight):
        """
        初始化 PyFooStruct
        """
        self.foo.u32PixelFormat = u32PixelFormat
        self.foo.iWidth = iWidth
        self.foo.iHeight = iHeight
        memset(self.foo.pPlane, 0, sizeof(self.foo.pPlane))  # 初始化 pPlane 数组为 NULL
        memset(self.foo.pPitch, 0, sizeof(self.foo.pPitch))  # 初始化 pPitch 数组为 0

    def __repr__(self):
        """
        返回结构体的字符串表示
        """
        return f"PyFooStruct(u32PixelFormat={self.foo.u32PixelFormat}, iWidth={self.foo.iWidth}, iHeight={self.foo.iHeight})"

    def set_plane(self, int index, unsigned char* plane_ptr):
        """
        设置 pPlane 中的某个指针
        """
        if index < 0 or index >= 4:
            raise IndexError("Index out of range for pPlane")
        self.foo.pPlane[index] = plane_ptr

    def set_pitch(self, int index, int pitch_value):
        """
        设置 pPitch 中的某个值
        """
        if index < 0 or index >= 4:
            raise IndexError("Index out of range for pPitch")
        self.foo.pPitch[index] = pitch_value

    def get_plane(self, int index):
        """
        获取 pPlane 中的某个指针
        """
        if index < 0 or index >= 4:
            raise IndexError("Index out of range for pPlane")
        return self.foo.pPlane[index]

    def get_pitch(self, int index):
        """
        获取 pPitch 中的某个值
        """
        if index < 0 or index >= 4:
            raise IndexError("Index out of range for pPitch")
        return self.foo.pPitch[index]


def foo_dummy_print(PyFooStruct py_foo):
    """
    调用 C 函数 FooDummyPrint
    """
    result = FooDummyPrint(&py_foo.foo)
    return result


def process():
    # Create a PyFooStruct object
    foo_struct = PyFooStruct(0,16,16)

    # Call the dummy print function
    foo_dummy_print(foo_struct)

