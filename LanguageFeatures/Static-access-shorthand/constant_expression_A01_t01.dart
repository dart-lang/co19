// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given an expression that is a prefix of
/// `<staticMemberShorthandHead> <selector>*`, whose assigned shorthand context
/// denotes a declaration D, and where the identifier or `new` of the
/// `<staticMemberShorthandHead>` denotes a static declaration or constructor
/// declaration S when looked up on D.
/// - An expression of the form `const .id(arguments)` or
///   `const .new(arguments)` is a constant expression. It's a compile-time
///   error if S does not declare a constant constructor, and if any expression
///   in `arguments`, which are all in a constant context, is not a constant
///   expression.
///
/// @description Checks that expressions of the form `const '.' id(arguments)`
/// and `const '.' new(arguments)` are constant expressions.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class C {
  final String value;
  const C(this.value);
  const C.id(this.value);
  const factory C.f(String value) = C;
}

extension type const ET(String value) {
  const ET.id(this.value);
  const factory ET.f(String value) = ET;
}

main() {
  const C c1 = const .new("one");
  Expect.equals("one", c1.value);

  const C c2 = const .id("two");
  Expect.equals("two", c2.value);

  const C c3 = const .f("three");
  Expect.equals("three", c3.value);

  const ET et1 = const .new("new");
  Expect.equals("new", et1.value);

  const ET et2 = const .id("id");
  Expect.equals("id", et2.value);

  const ET et3 = const .f("f");
  Expect.equals("f", et3.value);
}
