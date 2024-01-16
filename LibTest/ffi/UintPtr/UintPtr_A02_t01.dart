// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The C uintptr_t type.
///
/// The [UintPtr] type is a native type, and should not be constructed in Dart
/// code. It occurs only in native type signatures and as annotation on [Struct]
/// and [Union] fields.
///
/// @description Checks that this represents C uintptr_t type
/// @author sgrekhov22@gmail.com

import "dart:ffi";
import 'package:ffi/ffi.dart';
import "../../../Utils/expect.dart";

void main() {
  Pointer<UintPtr> p1 = calloc<UintPtr>(2);
  try {
    if (sizeOf<UintPtr>() == 4) {
      Expect.equals(4, (p1 + 1).address - p1.address);
    } else {
      Expect.equals(8, (p1 + 1).address - p1.address);
      Expect.equals(8, sizeOf<UintPtr>());
    }
  } finally {
    calloc.free(p1);
  }
}
