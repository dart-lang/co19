// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion  External fields also cannot be initialized by constructors since
/// no Dart object is being created.
///
/// @description Checks that Union subclass fields cannot be initialized by the
/// constructors
/// @author sgrekhov@unipro.ru
/// @issue 46813

import "dart:ffi";

final class U1 extends Union {
  @Int8()
  external int i;

  U1(this.i);
//        ^
// [analyzer] unspecified
// [cfe] unspecified
}

void main() {
  new U1(42);
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
}
