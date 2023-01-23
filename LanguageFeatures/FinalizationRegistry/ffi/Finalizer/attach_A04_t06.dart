// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The value and detach arguments ... Both must be objects supported
/// as an [Expando] key.
///
/// @description Checks that [value] must be supported as an [Expando] key.
/// Test dart:ffi struct.
/// @author iarkh@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import '../../../../Utils/expect.dart';

final Finalizer finalizer = Finalizer((_) { throw "Should not reach here"; });

class S extends Struct {
  @Int32()
  external int x;
}

main() {
  Pointer<S> p = calloc<S>();
  S s = p.ref;
  try {
    Expect.throws(() {
      finalizer.attach(p, "Finalization token");
    });
  } finally {
    calloc.free(p);
  }
}
