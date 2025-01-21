// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Case ⟨Static or library variable⟩. If `d` declares a static or
/// library variable, the implicitly induced getter of `id` executes as follows:
/// ...
/// - Constant variable. If `d` declares a constant variable with the
///   initializing expression `e`, the result of executing the implicitly
///   induced getter is the value of the constant expression `e`.
///
/// @description Checks the result of the implicit getter of a constant static
/// variable.
/// @author msyabro

import "../../../Utils/expect.dart";

class Const {
  final x;
  const Const(this.x);
}

const one = const Const(1);
const int two = 2;

class C {
  static const one = const Const(1);
  static const int two = 2;
}

mixin M {
  static const one = const Const(1);
  static const int two = 2;
}

enum E {
  e0;
  static const one = const Const(1);
  static const int two = 2;
}

class A {}

extension Ext on A {
  static const one = const Const(1);
  static const int two = 2;
}

extension type ET(int _) {
  static const one = const Const(1);
  static const int two = 2;
}

main() {
  Expect.identical(1, one.x);
  Expect.identical(2, two);
  Expect.identical(1, C.one.x);
  Expect.identical(2, C.two);
  Expect.identical(1, M.one.x);
  Expect.identical(2, M.two);
  Expect.identical(1, E.one.x);
  Expect.identical(2, E.two);
  Expect.identical(1, Ext.one.x);
  Expect.identical(2, Ext.two);
  Expect.identical(1, ET.one.x);
  Expect.identical(2, ET.two);
}
