// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Pointer<T> elementAt(int index)
///  Pointer arithmetic (takes element size into account).
///  This method must be invoked with a compile-time constant T.
///  Does not accept dynamic invocations -- where the type of the receiver is
///  dynamic.
///
/// @description Checks negative argument value
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import '../../../Utils/expect.dart';

void main() {
  Pointer<Int8> p1 = calloc<Int8>(3);
  try {
    p1.elementAt(0).value = 42;
    Pointer<Int8> p2 = new Pointer.fromAddress(p1.elementAt(1).address);
    Expect.equals(42, p2.elementAt(-1).value);
  } finally {
    calloc.free(p1);
  }
}
