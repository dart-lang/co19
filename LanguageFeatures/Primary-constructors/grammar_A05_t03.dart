// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Consider a factory constructor declaration of the form
/// `factory C(...` optionally starting with zero or more of the modifiers
/// `const`, `augment`, or `external`. Assume that `C` is the name of the
/// enclosing class, mixin class, enum, or extension type. In this situation,
/// the declaration declares a constructor whose name is `C`.
///
/// Without this special rule, such a declaration would declare a constructor
/// named `C.C`. With this rule it declares a constructor named `C`, which is
/// the same as today.
///
/// @description Check that in case of a factory constructor declaration of the
/// form `factory C(...` the declaration declares a constructor whose name is
/// `C`. Test an extension type.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations,declaring-constructors

import '../../Utils/expect.dart';
import '../../Utils/static_type_helper.dart';

extension type const ET1.foo(int v) {
  const factory ET1(int v) = ET1.foo;
}

extension type ET2.foo(int v) {
  factory ET2(int v) => ET2.foo(v + 1);
}

extension type const ET3._(int v) {
  const ET3.foo(this.v);
  const factory ET3(int v);

  augment const factory ET3(int v) = ET3.foo;
}

extension type ET4._(int v) {
  ET4.foo(this.v);
  factory ET4(int v);

  augment factory ET4(int v) => ET4.foo(v + 1);
}

extension type ET5._(int v) {
  external factory ET5(int v);
}

extension type ET6._(int v) {
  external const factory ET6(int v);
}

main() {
  var et1 = ET1.new;
  Expect.equals(1, et1(1).v);
  var et2 = ET2.new;
  Expect.equals(2, et2(1).v);
  var et3 = ET3.new;
  Expect.equals(1, et3(1).v);
  var et4 = ET4.new;
  Expect.equals(2, et4(1).v);
  var et5 = ET5.new;
  et5.expectStaticType<Exactly<ET5 Function(int)>>();
  var et6 = ET6.new;
  et6.expectStaticType<Exactly<ET6 Function(int)>>();
}
