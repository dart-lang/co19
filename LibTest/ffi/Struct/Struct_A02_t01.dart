// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Struct()
/// Instances of a subclass of Struct have reference semantics and are backed by
/// native memory. The may allocated via allocation or loaded from a Pointer, but
/// cannot be created by a generative constructor.
///
/// @description Checks that it is a compile time error if 'Struct' subclasses
/// are created by generative constructor
/// @author sgrekhov@unipro.ru
/// @issue 44987

import "dart:ffi";

final class S1 extends Struct {
  @Int8()
  external int i;

  S1() : super();
}

void main() {
  S1 s1 = new S1();
//            ^^
// [analyzer] unspecified
// [cfe] unspecified
}
