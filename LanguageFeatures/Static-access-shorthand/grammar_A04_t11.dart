// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
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
/// the `^` and `^=` operators.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

import '../../Utils/expect.dart';

class C {
  static C two = C(2);

  int value;
  C(this.value);

  C operator ^(C other) => C(value ^ other.value);
}

mixin M {
  static M two = MC(2);

  M operator ^(M other) => MC((this as MC).value ^ (other as MC).value);
}
class MC with M {
  int value;
  MC(this.value);
}

enum E {
  e0, e1, e2;
  static E two = E.e2;

  E operator ^(E other) => E.e0;
}

extension type ET(int v) implements int {
  static ET two = ET(2);

  ET operator ^(ET other) => ET(this.v ^ other.v);
}

main() {
  C c = C(7) ^ .two;
  Expect.equals(5, c.value);
  c ^= .two;
  Expect.equals(7, c.value);

  M m = MC(7) ^ .two;
  Expect.equals(5, (m as MC).value);
  m ^= .two;
  Expect.equals(7, (m as MC).value);

  E e1 = E.e2 ^ .two;
  Expect.equals(E.e0, e1);
  e1 ^= .two;
  Expect.equals(E.e0, e1);

  E e2 = E.e2 ^ .e1;
  Expect.equals(E.e0, e2);
  e2 ^=E.e1;
  Expect.equals(E.e0, e2);

  ET et = ET(8) ^ .two;
  Expect.equals(10, et.v);
  et ^= .two;
  Expect.equals(8, et.v);
}
