// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A static member shorthand expression should be a potentially
/// constant expression if the corresponding explicit static member plus
/// selectors expression would be, which currently means that it's a potentially
/// constant expression if and only if it's a constant expression.
///
/// @description Checks that a static member shorthand expression can be used in
/// a constant `as` expression.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class C {
  static const C one = const C(1);
  final int v;
  const C(this.v);
}

mixin M on C {
  static const M one = const MC(1);
}

class MC extends C with M {
  const MC(super.v);
}

enum E {
  e1, e2;
  static const E one = E.e1;
}

extension type const ET(int v) {
  static const ET one = const ET(1);
}

main() {
  const C c = .one as C;            // ignore: unnecessary_cast
  Expect.identical(const C(1), c);
  const M m = .one as M;            // ignore: unnecessary_cast
  Expect.identical(const MC(1), m);
  const E e = .one as E;            // ignore: unnecessary_cast
  Expect.identical(E.e1, e);
  const ET et = .one as ET;         // ignore: unnecessary_cast
  Expect.identical(const ET(1), et);
}
