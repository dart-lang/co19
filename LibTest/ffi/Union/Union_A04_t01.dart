// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion  Instances of a subclass of Union have reference semantics and
/// are backed by native memory. The may allocated via allocation or loaded from
/// a Pointer, but cannot be created by a generative constructor.
///
/// @description Checks that instances of the Union subclass cannot be created
/// by generative constructors
/// @author sgrekhov@unipro.ru
/// @issue 46191

import "dart:ffi";

final class U1 extends Union {
  @Int8()
  external int i;

  U1(int x) {
    i = x;
  }
}

void main() {
  U1 u1 = new U1(42);
//            ^^
// [analyzer] unspecified
// [cfe] unspecified
}
