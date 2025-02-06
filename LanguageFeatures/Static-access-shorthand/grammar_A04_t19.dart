// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We introduce grammar productions of the form:
/// ```
/// <postfixExpression> ::= ...            -- all current productions
///     | <staticMemberShorthand>          -- added production
///
/// <constantPattern> ::=  ...             -- all current productions
///     | <staticMemberShorthandValue>     -- No selectors, no `.new`.
///
/// <staticMemberShorthand> ::= <staticMemberShorthandHead> <selector>*
///
/// <staticMemberShorthandHead> ::=
///       <staticMemberShorthandValue>
///     | '.' 'new'                                       -- shorthand unnamed constructor
///
/// <staticMemberShorthandValue> ::=                      -- something that can potentially create a value.
///     | '.' <identifier>                                -- shorthand for qualified name
///     | 'const' '.' (<identifier> | 'new') <arguments>  -- shorthand for constant object creation
///  ```
///
/// @description Checks that the static access shorthand syntax can be used with
/// the `[]=` operator. Test the second operand.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

import '../../Utils/expect.dart';

class C {
  static C zero = C(0);
  int v;
  List<int> values = [1, 2, 3];

  C(this.v);
  void operator []=(int index, C value) {
    values[index] = value.v;
  }
}

mixin M {
  static M two = MO(2);
  List<int> values = [1, 2, 3];

  void operator []=(int index, M value) {
    values[index] = (value as MO).v;
  }
}
class MO with M {
  int v;
  MO(this.v);
}

enum E {
  e0(0), e1(1), e2(2);
  final int v;
  static List<int> vals = [1, 2, 3];
  static E two = E.e2;
  const E(this.v);

  void operator []=(int index, E value) {
    E.vals[index] = value.v;
  }
}

extension type ET(int v) implements int {
  static ET two = ET(2);
  static List<int> values = [1, 2, 3];

  void operator []=(int index, ET value) {
    ET.values[index] = value.v;
  }
}

main() {
  C c = C(0);
  c[1] = .zero;
  Expect.equals(0, c.values[1]);
  M m = MO(0);
  m[0] = .two;
  Expect.equals(2, m.values[0]);
  E.e0[0] = .two;
  Expect.equals(2, E.vals[0]);
  E.e0[0] = .e1;
  Expect.equals(1, E.vals[0]);
  ET et = ET(0);
  et[0] = .two;
  Expect.equals(2, ET.values[0]);
}
