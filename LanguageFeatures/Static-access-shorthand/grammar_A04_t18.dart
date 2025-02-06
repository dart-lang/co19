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
/// the `[]=` operator. Test the first operand.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

import '../../Utils/expect.dart';

class C {
  static C zero = C(0);
  int index;
  List<int> values = [1, 2, 3];

  C(this.index);
  void operator []=(C ind, int value) {
    values[ind.index] = value;
  }
}

mixin M {
  static M two = MO(2);
  List<int> values = [1, 2, 3];

  void operator []=(M ind, int value) {
    values[(ind as MO).index] = value;
  }
}
class MO with M {
  int index;
  MO(this.index);
}

enum E {
  e0(0), e1(1), e2(2);
  final int value;
  static List<int> vals = [1, 2, 3];
  static E two = E.e2;
  const E(this.value);

  void operator []=(E ind, int value) {
    E.vals[ind.value] = value;
  }
}

extension type ET(int v) implements int {
  static ET two = ET(2);
  static List<int> values = [1, 2, 3];

  void operator []=(ET index, int value) {
    ET.values[index.v] = value;
  }
}

main() {
  C c = C(0);
  c[.zero] = 42;
  Expect.equals(42, c.values[0]);

  M m = MO(0);
  m[.two] = 42;
  Expect.equals(42, m.values[2]);

  E.e0[.two] = 42;
  Expect.equals(42, E.vals[2]);
  E.e0[.e1] = 42;
  Expect.equals(42, E.vals[1]);

  ET et = ET(0);
  et[.two] = 42;
  Expect.equals(42, ET.values[2]);
}
