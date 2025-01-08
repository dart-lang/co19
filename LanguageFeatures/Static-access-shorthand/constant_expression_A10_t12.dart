// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A static member shorthand expression should be a potentially
/// constant expression if the corresponding explicit static member plus
/// selectors expression would be, which currently means that it's a potentially
/// constant expression if and only if it's a constant expression.
///
/// @description Checks that a static member shorthand expression can be used in
/// a right operand of a constant `e1 == e2` expression.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class C {
  static const C answer = const C(42);
  final int v;
  const C(this.v);
}

mixin M on C {
  static const M answer = const MC(42);
}

class MC extends C with M {
  const MC(super.v);
}

enum E {
  e0;
  static const E answer = E.e0;
}

extension type const ET(int v) {
  static const ET answer = const ET(42);
}

main() {
  const b1 = C(42) == .answer;
  Expect.isTrue(b1);
  const b2 = (MC(42) as M) == .answer;
  Expect.isTrue(b2);
  const b3 = E.e0 == .answer;
  Expect.isTrue(b3);
  const b4 = ET(42) == .answer;
  Expect.isTrue(b4);
}
