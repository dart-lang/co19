// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion With this feature, it is no longer an error to have the following
/// situations:
/// ...
/// - An `implements` clause of a declaration `D` contains an operand `T`, and
///   an `extends` or `with` clause of `D` contains an operand `S`, and `T` and
///   `S` denote the same type.
///
/// @description Checks that it is not an error if `implements` and `with`
/// clauses contain the same type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

mixin class I {
  String get id => "I";
}

typedef IAlias = I;

class C1 implements I {}
augment class C1 with I {}

class C2 implements I  {}
augment class C2 with IAlias {}

class C3 implements IAlias {}
augment class C3 with I {}

class C4 implements IAlias {}
augment class C4 with IAlias {}

main() {
  Expect.equals("I", C1().id);
  Expect.equals("I", C2().id);
  Expect.equals("I", C3().id);
  Expect.equals("I", C4().id);
}
