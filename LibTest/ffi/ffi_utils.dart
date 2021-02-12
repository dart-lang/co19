  /*
 * Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Utils for co19 ffi tests
 * @author sgrekhov@unipro.ru
 */
import 'dart:ffi';
import 'dart:io' show Platform;

const TEST_DYNAMIC_LIB = "ffi_test_dynamic_library";
const TEST_FUNCTIONS_LIB = "ffi_test_functions";

final DynamicLibrary stdlib = Platform.isWindows
    ? DynamicLibrary.open('kernel32.dll') : DynamicLibrary.process();

String libPath(String libName, {String path = ""}) {
  if (Platform.isLinux || Platform.isAndroid || Platform.isFuchsia)
    return path + "lib" + libName + ".so";
  if (Platform.isMacOS) return path + "lib" + libName + ".dylib";
  if (Platform.isWindows) return path + libName + ".dll";
  throw Exception("Platform not implemented");
}

String libPathAbsolute(String libName, {String path = ""}) {
  String p = libPath(libName, path: path);
  String exPath = Platform.resolvedExecutable;
  String out = Platform.pathSeparator + "out" + Platform.pathSeparator;
  int ind = exPath.indexOf(out);
  if (ind < 0) {
    throw Exception("Unable to resolve absolute path to the library '${libName}'");
  }
  int ind2 = exPath.indexOf(Platform.pathSeparator, ind + out.length);
  return exPath.substring(0, ind2) + Platform.pathSeparator + p;
}

typedef PosixCallocNative = Pointer Function(IntPtr num, IntPtr size);
typedef PosixCalloc = Pointer Function(int num, int size);
final PosixCalloc posixCalloc =
stdlib.lookupFunction<PosixCallocNative, PosixCalloc>('calloc');

typedef PosixFreeNative = Void Function(Pointer);
typedef PosixFree = void Function(Pointer);
final PosixFree posixFree =
stdlib.lookupFunction<PosixFreeNative, PosixFree>('free');

typedef WinGetProcessHeapFn = Pointer Function();
final WinGetProcessHeapFn winGetProcessHeap = stdlib
    .lookupFunction<WinGetProcessHeapFn, WinGetProcessHeapFn>('GetProcessHeap');
final Pointer processHeap = winGetProcessHeap();

typedef WinHeapAllocNative = Pointer Function(Pointer, Uint32, IntPtr);
typedef WinHeapAlloc = Pointer Function(Pointer, int, int);
final WinHeapAlloc winHeapAlloc =
stdlib.lookupFunction<WinHeapAllocNative, WinHeapAlloc>('HeapAlloc');

typedef WinHeapFreeNative = Int32 Function(
    Pointer heap, Uint32 flags, Pointer memory);
typedef WinHeapFree = int Function(Pointer heap, int flags, Pointer memory);
final WinHeapFree winHeapFree =
stdlib.lookupFunction<WinHeapFreeNative, WinHeapFree>('HeapFree');

const int HEAP_ZERO_MEMORY = 8;

class _Allocator implements Allocator {
  const _Allocator();

  @override
  Pointer<T> allocate<T extends NativeType>(int byteCount, {int? alignment}) {
    Pointer<T> result;
    if (Platform.isWindows) {
      result = winHeapAlloc(processHeap, HEAP_ZERO_MEMORY, byteCount)
          .cast();
    } else {
      result = posixCalloc(byteCount, 1).cast();
    }
    if (result.address == 0) {
      throw ArgumentError('Could not allocate $byteCount bytes.');
    }
    return result;
  }

  @override
  void free(Pointer pointer) {
    if (Platform.isWindows) {
      if (winHeapFree(processHeap, 0, pointer) == 0) {
        throw ArgumentError('Could not free $pointer.');
      }
    } else {
      posixFree(pointer);
    }
  }
}

const Allocator calloc = const _Allocator();
