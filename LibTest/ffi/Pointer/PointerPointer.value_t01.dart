// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The pointer at address.
///
/// A Pointer is unboxed before being stored (as if by .address), and the
/// pointer is boxed (as if by Pointer.fromAddress) when loaded.
///
/// @description Check that this property returns/sets the pointer at the
/// address
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "package:ffi/ffi.dart";
import '../../../Utils/expect.dart';

void main() {
  Pointer<Pointer<Double>> p = calloc<Pointer<Double>>();
  try {
    p.value = calloc<Double>();
    p.value.value = 3.14;
    Expect.equals(3.14, p.value.value);
  } finally {
    calloc.free(p);
  }
}
