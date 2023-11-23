// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Pointer<T extends NativeType>
/// Represents a pointer into the native C memory. Cannot be extended.
///
/// @description Checks that it is not an error if pointer class is a top type
/// @author sgrekhov@unipro.ru
/// @issue 47746

import "dart:ffi";

void main() {
  Pointer<dynamic> p1 = Pointer.fromAddress(0x0);
  Pointer<void> p2 = Pointer.fromAddress(0x0);
  Pointer<Object?> p3 = Pointer.fromAddress(0x0);
  Pointer<Never> p4 = Pointer.fromAddress(0x0);
}
