// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Pointer<T> elementAt(int index)
///  Pointer arithmetic (takes element size into account).
///  This method must be invoked with a compile-time constant T.
///  Does not accept dynamic invocations -- where the type of the receiver is
///  dynamic.
///
/// @description Checks that this method must be invoked with a compile-time
/// constant T
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";

void main() {
  Pointer<Int64> p1 = calloc<Int64>(3);
  try {
    Pointer<NativeFunction> p2 = new Pointer.fromAddress(p1.address);
    p2.elementAt(1);
//  ^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  } finally {
    calloc.free(p1);
  }
}
