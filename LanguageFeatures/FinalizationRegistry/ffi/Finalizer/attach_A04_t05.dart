// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The value and detach arguments ... Both must be objects supported
/// as an [Expando] key.
///
/// @description Checks that [value] must be supported as an [Expando] key.
/// Test dart:ffi pointers.
/// @author iarkh@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import '../../../../Utils/expect.dart';

final Finalizer finalizer = Finalizer((_) { throw "Should not reach here"; });
Object detachToken = Object;

main() {
  Pointer<Int8> p1 = calloc<Int8>();
  try {
    Expect.throws(() {
      finalizer.attach(p1, "Finalization token");
    });
  } finally {
    calloc.free(p1);
  }

  Pointer<Int16> p2 = calloc<Int16>();
  try {
    Expect.throws(() {
      finalizer.attach(p2, "Finalization token");
    });
  } finally {
    calloc.free(p2);
  }

}
