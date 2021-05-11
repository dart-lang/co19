// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Pointer<T> elementAt(int index)
///  Pointer arithmetic (takes element size into account).
///  This method must be invoked with a compile-time constant T.
///  Does not accept dynamic invocations -- where the type of the receiver is
///  dynamic.
///
/// @description Checks that it is allowed to read memory outside the border
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";

void main() {
  Pointer<Int8> p1 = calloc<Int8>(3);
  try {
    p1.elementAt(42);
  } finally {
    calloc.free(p1);
  }
}
