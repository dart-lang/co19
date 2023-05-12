// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All field declarations in a Union subclass declaration must be
/// marked external. You cannot create instances of the class, only have it
/// point to existing native memory, so there is no memory in which to store
/// non-native fields.
///
/// @description Checks that all field declarations in a Union subclass
/// declaration must be marked external
/// @author sgrekhov@unipro.ru
/// @issue 45293

import "dart:ffi";
import "package:ffi/ffi.dart";

final class U1 extends Union {
  @Int16()
  int? i;
//^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void main() {
  Pointer<U1> p = calloc<U1>();
  U1 u1 = p.ref;
  print(u1.i);
}
