// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Pointer<T> elementAt(int index)
///  Pointer arithmetic (takes element size into account).
///  This method must be invoked with a compile-time constant T.
///  Does not accept dynamic invocations -- where the type of the receiver is
///  dynamic.
///
/// @description Checks that this method implements pointer arithmetic
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import '../../../Utils/expect.dart';

final class MyStruct extends Struct {
  @Int8()
  external int x;
  @Float()
  external double y;
}

void main() {
  Pointer<MyStruct> p1 = calloc<MyStruct>(2);
  try {
    Expect.isTrue(p1.elementAt(1).address - p1.elementAt(0).address > 0);
  } finally {
    calloc.free(p1);
  }
}
