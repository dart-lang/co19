// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All field declarations in a Struct subclass declaration must be
/// marked external. You cannot create instances of the class, only have it point
/// to existing native memory, so there is no memory in which to store non-native
/// fields. External fields also cannot be initialized by constructors since no
/// Dart object is being created.
///
/// @description Checks that all field declarations in a Struct subclass
/// declaration cannot have initializers
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=class-modifiers

import "dart:ffi";

final class S1 extends Struct {
  @Double()
  double d = 3.14;
//       ^
// [analyzer] unspecified
// [cfe] unspecified
}

void main() {
  S1? s1;
}
