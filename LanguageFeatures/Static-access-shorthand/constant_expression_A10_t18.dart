// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A static member shorthand expression should be a potentially
/// constant expression if the corresponding explicit static member plus
/// selectors expression would be, which currently means that it's a potentially
/// constant expression if and only if it's a constant expression.
///
/// @description Checks that a static member shorthand expression can be used in
/// a constant `e1 ?? e2` expression.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class C {
  static const C one = const C(1);
  static const C? two = null;
  final int v;
  const C(this.v);
}

mixin M on C {
  static const M one = const MC(1);
  static const M? two = null;
}

class MC extends C with M {
  const MC(super.v);
}

enum E {
  e1, e2;
  static const E one = E.e1;
  static const E? two = null;
}

extension type const ET(int v) {
  static const ET one = const ET(1);
  static const ET? two = null;
}

main() {
  const C c = .two ?? .one;
  Expect.identical(const C(1), c);
  const M m = .two ?? .one;
  Expect.identical(const MC(1), m);
  const E e = .two ?? .one;
  Expect.identical(E.e1, e);
  const ET et = .two ?? .one;
  Expect.identical(const ET(1), et);
}
