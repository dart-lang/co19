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

void main() {
  Pointer<Int16> p1 = calloc<Int16>(3);
  try {
    Expect.equals(2, p1.elementAt(1).address - p1.address);
    Expect.equals(2, p1.elementAt(2).address - p1.elementAt(1).address);
  } finally {
    calloc.free(p1);
  }
}
