// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion NativeType's subtypes represent a native type in C.
///
/// NativeType's subtypes are not constructible in the Dart code and serve purely a
/// s markers in type signatures.
///
/// @description Checks that this class cannot be extended
/// @author sgrekhov@unipro.ru

import "dart:ffi";

class C1 extends NativeType {
//               ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 implements NativeType {
//                  ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3 extends Object with NativeType {
//                           ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void main() {
  C1? c1;
  C2? c2;
  C3? c3;
}
