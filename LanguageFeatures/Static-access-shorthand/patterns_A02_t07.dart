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
/// constant pattern it's treated as a normal constant expression, using the
/// context type it's given.
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
  e1, e2;

  static const E one = E.e1;
}

extension type const ET(int value) implements int {
  static const ET one = ET(1);
}

main() {
  String res = "";
  if (C(1) case const (.one)) {
    res = "C Ok";
  }
  Expect.equals("C Ok", res);

  M m = MC(1);
  if (m case const (.one)) {
    res = "M Ok";
  }
  Expect.equals("M Ok", res);

  if (E.e1 case const (.one)) {
    res = "E Ok";
  }
  Expect.equals("E Ok", res);

  if (E.e1 case const (.e1)) {
    res = "E Ok again";
  }
  Expect.equals("E Ok again", res);

  if (ET(1) case const (.one)) {
    res = "ET Ok";
  }
  Expect.equals("ET Ok", res);
}
