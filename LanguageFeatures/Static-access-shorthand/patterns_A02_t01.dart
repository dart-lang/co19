// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a static member shorthand expression occurs elsewhere in a
/// pattern where a constant expression is generally allowed, like
/// `const (big ? .big : .little)` or `< .one`, except for the relational
/// pattern `== e`, it's treated as a normal constant expression, using the
/// context type it's given. The expression of `const (...)` will have the
/// matched value type as context type. The relational pattern expressions,
/// other than for `==` and `!=`, will have the parameter type of the
/// corresponding operator of the matched value type as context type.
///
/// @description Checks that if a static member shorthand expression occurs in a
/// logical-or pattern it's treated as a normal constant expression, using the
/// context type it's given.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class C {
  final int value;
  const C(this.value);

  static const C one = C(1);
  static const C two = C(2);

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
  static const M two = MC(2);
}

class MC extends C with M {
  const MC(super.value);
}

enum E {
  e1,
  e2;

  static const E one = E.e1;
  static const E two = E.e2;
}

extension type const ET(int v) implements int {
  static const ET one = ET(1);
  static const ET two = ET(2);
}

main() {
  String res = "";
  if (C(1) case .one || .two) {
    res = "C one or two";
  }
  Expect.equals("C one or two", res);

  M m = MC(2);
  if (m case .one || .two) {
    res = "M one or two";
  }
  Expect.equals("M one or two", res);

  if (E.e1 case .one || .two) {
    res = "E one or two";
  }
  Expect.equals("E one or two", res);

  if (E.e2 case .e1 || .e2) {
    res = "E one or two again";
  }
  Expect.equals("E one or two again", res);

  if (ET(1) case .one || .two) {
    res = "ET one or two";
  }
  Expect.equals("ET one or two", res);
}
