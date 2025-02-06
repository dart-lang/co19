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
/// the `[]` operator.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

import '../../Utils/expect.dart';

class C {
  static C zero = C(0);
  int index;
  List<int> values = [1, 2, 3];

  C(this.index);
  int operator [](C ind) => values[ind.index];
}

mixin M {
  static M two = MO(2);
  List<int> values = [1, 2, 3];

  int operator [](M ind) => values[(ind as MO).index];
}
class MO with M {
  int index;
  MO(this.index);
}

enum E {
  e0(0), e1(1), e2(2);
  final int value;
  static E two = E.e2;
  const E(this.value);

  int operator [](E ind) => values[ind.value].value;
}

extension type ET(int v) implements int {
  static ET two = ET(2);
  static List<int> values = [1, 2, 3];

  int operator [](ET index) => ET.values[index.v];
}

main() {
  Expect.equals(1, C(0)[.zero]);
  Expect.equals(3, (MO(0) as M)[.two]);
  Expect.equals(2, E.e1[.two]);
  Expect.equals(1, E.e1[.e1]);
  Expect.equals(3, ET(0)[.two]);

}
