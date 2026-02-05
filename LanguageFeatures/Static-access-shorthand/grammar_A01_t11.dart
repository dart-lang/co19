// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
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
/// @description Checks that private static members and values of an enum can be
/// accessed using the static access short syntax.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

import '../../Utils/expect.dart';

enum E {
  _v1("v1"), _v2("v2");

  final String value;
  const E(this.value);

  static E get _staticGetter => _v1;
  static E _staticMethod() => _v2;
}

main() {
  E e0 = ._v1;
  Expect.equals(E._v1, e0);

  E e1 = ._staticGetter;
  Expect.equals("v1", e1.value);

  E e2 = ._staticMethod();
  Expect.equals("v2", e2.value);

  E e3 = (._v1);
  Expect.equals(E._v1, e3);

  E e4 = (._staticGetter);
  Expect.equals("v1", e4.value);

  E e5 = (._staticMethod());
  Expect.equals("v2", e5.value);
}
