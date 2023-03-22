// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Not all objects are supported as targets for weak references. The
/// WeakReference constructor will reject any object that is not supported as an
/// Expando key.
///
/// @description Check that WeakReference constructor rejects any object that is
/// not supported as an Expando key. Test dart:ffi structs.
/// @author sgrekhov@unipro.ru
/// @issue 48264

// SharedOptions=--enable-experiment=class-modifiers

import "dart:ffi";
import "package:ffi/ffi.dart";
import '../../../../Utils/expect.dart';

final class S extends Struct {
  @Int32()
  external int x;
}

main() {
  Pointer<S> p1 = calloc<S>();
  try {
    Expect.throws(() {
      S s = p1.ref;
      WeakReference wr = WeakReference<S>(s);
    });
  } finally {
    calloc.free(p1);
  }
  Pointer<S> p2 = calloc<S>();
  try {
    Expect.throws(() {
      S s = p2.ref;
      WeakReference wr = WeakReference(s);
    });
  } finally {
    calloc.free(p2);
  }
}
