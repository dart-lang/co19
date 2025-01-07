// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Whether such an expression followed by more selectors is a
/// constant expression depends on the concrete selectors and types, but can use
/// the current rules which recursively asks about the receiver being a constant
/// function.
///
/// @description Checks that a constant expression shorthand followed by `!`
/// selector is still a constant.
/// @author sgrekhov22@gmail.com
/// @issue 59800

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class C {
  final String value;
  const C(this.value);
  const C.id(this.value);
  const factory C.f(String value) = C;

  static const C? instance = const C("C instance");
}

mixin M on C {
  static const M? instance = const MC("M instance");
}

class MC extends C with M {
  const MC(super.value);
}

enum E {
  e0("e0");
  final String value;
  const E(this.value);

  static const E? instance = E.e0;
}

extension type const ET(int value) {
  const ET.id(this.value);
  const factory ET.f(int value) = ET;

  static const ET? zero = const ET(0);
}

main() {
  const C c1 = const .new("one")!; // ignore: unnecessary_non_null_assertion
  Expect.equals("one", c1.value);

  const C c2 = const .id("two")!; // ignore: unnecessary_non_null_assertion
  Expect.equals("two", c2.value);

  const C c3 = const .f("three")!; // ignore: unnecessary_non_null_assertion
  Expect.equals("three", c3.value);

  const C c4 = .instance!;
  Expect.equals("C instance", c4.value);

  const M m = .instance!;
  Expect.equals("M instance", m.value);

  const E e1 = .e0!; // ignore: unnecessary_non_null_assertion
  Expect.equals(e1, E.e0);

  const E e2 = .instance!;
  Expect.equals("e0", e2.value);

  const ET et1 = const .new(1)!; // ignore: unnecessary_non_null_assertion
  Expect.equals(1, et1.value);

  const ET et2 = const .id(2)!; // ignore: unnecessary_non_null_assertion
  Expect.equals(2, et2.value);

  const ET et3 = const .f(3)!; // ignore: unnecessary_non_null_assertion
  Expect.equals(3, et3.value);

  const ET et4 = .zero!;
  Expect.equals(0, et4.value);
}
