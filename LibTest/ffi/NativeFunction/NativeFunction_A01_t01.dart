// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Represents a function type in C.
///
/// NativeFunction is not constructible in the Dart code and serves purely as
/// marker in type signatures.
///
/// @description Checks that this class cannot be extended
/// @author sgrekhov@unipro.ru

import "dart:ffi";

class C1<T extends Function> extends NativeFunction<T> {
//                                   ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2<T extends Function> implements NativeFunction<T> {
//                                      ^^^^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C3 extends Object with NativeFunction {
//                           ^^^^^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void main() {
  C1? c1;
  C2? c2;
  C3? c3;
}
