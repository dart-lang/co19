// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Since `!` does propagate a context,
/// `int x = (.tryParse(input))!;` does work, with a context type scheme of
/// `int?`, which is enough to allow `.tryParse`. Same for
/// `int x = .tryParse(input) ?? 0;` which gives the first operand the context
/// type `int?`.
///
/// @description Checks that `!` selector propagates the context type in case of
/// shorthand expression.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

import '../../Utils/expect.dart';

class C {
  int value;
  C(this.value);

  static C? get id => C(0);
}

mixin M on C {
  static M? get id => MC(1);
}
class MC = C with M;

enum E {
  e0(2);
  final int value;
  const E(this.value);

  static E? get id => E.e0;
}

extension type ET(int v) {
  static ET get id => ET(3);
}

main() {
  C c = .id!;
  Expect.equals(0, c.value);

  c = (.id)!;
  Expect.equals(0, c.value);

  M m = .id!;
  Expect.equals(1, m.value);

  m = (.id)!;
  Expect.equals(1, m.value);

  E e = .id!;
  Expect.equals(2, e.value);

  e = (.id)!;
  Expect.equals(2, e.value);

  ET et = .id!;
  Expect.equals(3, et.v);

  et = (.id)!;
  Expect.equals(3, et.v);
}
