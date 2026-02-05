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
/// @description Checks that private static members and constructors of an
/// extension type can be accessed using the static access short syntax.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

import '../../Utils/expect.dart';

extension type ET._(int v) {
  static ET get _staticGetter => ET._(1);
  static ET _staticMethod() => ET._(2);
  static List<ET> _instances = [ET._(0), ET._(1)];

  const ET._foo(this.v);
  ET._bar(this.v);
  const factory ET._baz(int v) = ET._foo;
}

main() {
  ET et0 = ._instances[0];
  Expect.equals(0, et0.v);

  ET et1 = ._staticGetter;
  Expect.equals(1, et1.v);

  ET et2 = ._staticMethod();
  Expect.equals(2, et2.v);

  ET et3 = ._(3);
  Expect.equals(3, et3.v);

  ET et4 = const ._foo(4);
  Expect.equals(4, et4.v);

  ET et5 = ._bar(5);
  Expect.equals(5, et5.v);

  ET et6 = ._baz(6);
  Expect.equals(6, et6.v);

  ET et7 = const ._baz(7);
  Expect.equals(7, et7.v);
}
