// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Pointer<T extends NativeType>
///  Represents a pointer into the native C memory. Cannot be extended.
///
/// @description Checks that it is a compile time error if pointer class is
/// wrong
/// @author sgrekhov@unipro.ru

import "dart:ffi";

void main() {
  Pointer<NotExistingClass> p = Pointer.fromAddress(0);
//        ^^^^^^^^^^^^^^^^
// [cfe] unspecified
// [analyzer] unspecified
}
