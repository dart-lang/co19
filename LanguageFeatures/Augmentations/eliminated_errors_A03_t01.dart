// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion With this feature, it is no longer an error to have the following
/// situations:
/// ...
/// - An `implements` clause of a mixin declaration `D` contains an operand `T`,
///   and an `on` clause of `D` contains an operand `S`, and `T` and `S` denote
///   the same type.
///
/// @description Checks that it is not an error if an `implements` clause of a
/// mixin declaration contains the same type as `on` clause.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

class I {
  String get id => "I";
}

typedef IAlias = I;

mixin M1 on I implements I {}

mixin M2 on I implements IAlias {}

mixin M3 on IAlias implements I {}

mixin M4 on IAlias implements IAlias {}

class MA1 = I with M1;
class MA2 = I with M2;
class MA3 = I with M3;
class MA4 = I with M4;

main() {
  Expect.equals("I", MA1().id);
  Expect.equals("I", MA2().id);
  Expect.equals("I", MA3().id);
  Expect.equals("I", MA4().id);
}
