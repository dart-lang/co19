// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All field declarations in a Union subclass declaration must
/// either have type int or float and be annotated with a NativeType
/// representing the native type, or must be of type Pointer.
///
/// @description Checks that it is a compile error if field is annotated
/// as Void
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=class-modifiers

import "dart:ffi";

final class U1 extends Union {
  @Void()
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  external int x;
//             ^
// [cfe] unspecified
}

final class U2 extends Union {
  @Void()
//^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  external double x;
//                ^
// [cfe] unspecified
}

void main() {
  U1? u1;
  U2? u2;
}
