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
/// declaration must be marked external
/// @author sgrekhov@unipro.ru
/// @issue 45293

// SharedOptions=--enable-experiment=class-modifiers

import "dart:ffi";
import "package:ffi/ffi.dart";

final class S1 extends Struct {
  @Double()
  double? d;
//^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void main() {
  Pointer<S1> p = calloc<S1>();
  S1 s1 = p.ref;
  print(s1.d);
}
