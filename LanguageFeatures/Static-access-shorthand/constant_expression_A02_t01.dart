// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given an expression that is a prefix of
/// `<staticMemberShorthandHead> <selector>*`, whose assigned shorthand context
/// denotes a declaration D, and where the identifier or `new` of the
/// `<staticMemberShorthandHead>` denotes a static declaration or constructor
/// declaration S when looked up on D.
/// ...
/// - An expression of the form `.<identifier>` is a constant expression if S
///   declares a corresponding static constant getter.
///
/// @description Checks that an expression of the form `'.' <identifier>` is a
/// constant expression if the appropriate declaration declares a constant
/// getter with the name `<identifier>`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

import '../../Utils/expect.dart';

class C {
  final String value;
  static const C instance = C("C instance");

  const C(this.value);
}

mixin M {
  static const M instance = MO();
}
class MO with M {
  final String value = "M instance";
  const MO();
}

extension type const ET(String value) {
  static const instance = ET("ET instance");
}

main() {
  const C c = .instance;
  Expect.equals("C instance", c.value);

  const M m = .instance;
  Expect.equals("M instance", (m as MO).value);

  const ET et = .instance;
  Expect.equals("ET instance", et.value);
}
