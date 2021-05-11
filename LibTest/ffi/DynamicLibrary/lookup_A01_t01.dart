// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Pointer<T> lookup <T extends NativeType>(String symbolName)
///  Looks up a symbol in the DynamicLibrary and returns its address in memory.
///  Equivalent of dlsym.
///
///  Throws an ArgumentError if it fails to lookup the symbol.
///
/// @description Checks that this method looks up a symbol in the DynamicLibrary
/// and returns its address in memory
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "../ffi_utils.dart";
import "../../../Utils/expect.dart";

void main() {
  final path = libPath(TEST_FUNCTIONS_LIB);
  DynamicLibrary dl = new DynamicLibrary.open(path);
  Pointer<Void> p1 = dl.lookup("ReturnMaxUint8");
  Pointer<Void> p2 = dl.lookup("ReturnMaxUint8");
  Expect.equals(p1, p2);
  Pointer<Void> p3 = dl.lookup("ReturnMaxUint16");
  Expect.notEquals(p1, p3);
  Expect.notEquals(p1.address, p3.address);
}
