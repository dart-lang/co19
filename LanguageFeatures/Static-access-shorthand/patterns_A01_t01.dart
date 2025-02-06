// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant pattern `<staticMemberShorthandValue>` is treated the
/// same as that static member shorthand as an expression that has no following
/// selectors, except with the matched value type is set as the shorthand
/// context of the `<staticMemberShorthandHead>`.
///
/// The restriction to `<staticMemberShorthandValue>` is intended to match the
/// existing allowed constant patterns, `<qualifiedIdentifier>` and
/// `<constObjectExpression>`, and nothing more, which is why it omits the
/// `.new` which is guaranteed to be a constructor tear-off. The shorthand
/// constant pattern `'.' <identifier>` must satisfy the same restrictions as
/// the `<qualifiedIdentifier>` constant pattern, mainly that it must denote a
/// constant getter.
///
/// @description Checks that for a constant pattern
/// `<staticMemberShorthandValue>` the matched value type is set as the
/// shorthand context of the `<staticMemberShorthandHead>`
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

import '../../Utils/expect.dart';

class C {
  final int value;
  const C(this.value);

  static const C one = C(1);

  @override
  bool operator ==(Object other) {
    if (other is C) {
      return other.value == value;
    }
    return false;
  }
}

mixin M on C {
  static const M one = MC(1);
}

class MC extends C with M {
  const MC(super.value);
}

enum E {
  e1,
  e2;

  static const E one = E.e1;
}

extension type const ET(int v) implements int {
  static const ET one = ET(1);
}

main() {
  String res = "";
  switch (C(1)) {
    case .one:
      res = "C one";
    default:
      res = "default";
  }
  Expect.equals("C one", res);

  res = switch (C(1)) {
    .one => "C one",
    _ => "default"
  };
  Expect.equals("C one", res);

  M m = MC(1);
  switch (m) {
    case .one:
      res = "M one";
    default:
      res = "default";
  }
  Expect.equals("M one", res);

  res = switch (m) {
    .one => "M one",
    _ => "default"
  };
  Expect.equals("M one", res);

  switch (E.e1) {
    case .one:
    res = "E one";
    default:
      res = "default";
  }
  Expect.equals("E one", res);

  res = switch (E.e1) {
    .one => "E one",
    _ => "default"
  };
  Expect.equals("E one", res);

  switch (E.e1) {
    case .e1:
      res = "E one";
    default:
      res = "default";
  }
  Expect.equals("E one", res);

  res = switch (E.e1) {
    .e1 => "E one",
    _ => "default"
  };
  Expect.equals("E one", res);

  switch (ET(1)) {
    case .one:
      res = "ET one";
    default:
      res = "default";
  }
  Expect.equals("ET one", res);

  res = switch (ET(1)) {
    .one => "ET one",
    _ => "default"
  };
  Expect.equals("ET one", res);
}
