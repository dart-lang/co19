// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Not all objects are supported as targets for weak references. The
/// WeakReference constructor will reject any object that is not supported as an
/// Expando key.
///
/// @description Check that WeakReference constructor rejects any object that is
/// not supported as an Expando key. Test dart:ffi unions.
/// @author sgrekhov@unipro.ru
/// @issue 48264

import "dart:ffi";
import "package:ffi/ffi.dart";
import '../../../../Utils/expect.dart';

class U extends Union {
  @Int32()
  external int x;
  @Int16()
  external int y;
}

main() {
  Pointer<U> p1 = calloc<U>();
  try {
    Expect.throws(() {
      U u = p1.ref;
      WeakReference wr = WeakReference<U>(u);
    });
  } finally {
    calloc.free(p1);
  }
  Pointer<U> p2 = calloc<U>();
  try {
    Expect.throws(() {
      U u = p2.ref;
      WeakReference wr = WeakReference(u);
    });
  } finally {
    calloc.free(p2);
  }
}
