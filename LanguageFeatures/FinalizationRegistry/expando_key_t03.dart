// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Not all objects are supported as targets for weak references. The
/// WeakReference constructor will reject any object that is not supported as an
/// Expando key.
///
/// @description Check that WeakReference constructor rejects any object that is
/// not supported as an Expando key. Test dart:ffi pointers.
/// @author sgrekhov@unipro.ru
/// @issue 48264

import "dart:ffi";
import "package:ffi/ffi.dart";
import "../../Utils/expect.dart";

main() {
  Pointer<Int8> p1 = calloc<Int8>();
  try {
    Expect.throws(() {
      WeakReference wr = WeakReference<Pointer<Int8>>(p1);
      print(wr.target);
    });
  } finally {
    calloc.free(p1);
  }
  Pointer<Int16> p2 = calloc<Int16>();
  try {
    Expect.throws(() {
      WeakReference wr = WeakReference(p2);
      print(wr.target);
    });
  } finally {
    calloc.free(p2);
  }
}
