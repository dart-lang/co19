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
/// @description Checks that private static members and constructors of a class
/// can be accessed using the static access short syntax.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

import '../../Utils/expect.dart';

class C {
  static C get _staticGetter => C._foo("Static getter");
  static C _staticMethod() => C._foo("Static method");
  static List<C> _instances = [C._foo("one"), C._foo("two")];
  final String value;

  C._(this.value);
  const C._foo(this.value);
  factory C._bar(String v) = C._;
  const factory C._baz(String v) = C._foo;
}

main() {
  C c1 = ._staticGetter;
  Expect.equals("Static getter", c1.value);

  C c2 = ._staticMethod();
  Expect.equals("Static method", c2.value);

  C c3 = ._instances[0];
  Expect.equals("one", c3.value);

  C c4 = ._("new");
  Expect.equals("new", c4.value);

  C c5 = ._foo("foo");
  Expect.equals("foo", c5.value);

  C c6 = const ._foo("const foo");
  Expect.equals("const foo", c6.value);

  C c7 = ._bar("bar");
  Expect.equals("bar", c7.value);

  C c8 = ._baz("baz");
  Expect.equals("baz", c8.value);

  C c9 = const ._baz("const baz");
  Expect.equals("const baz", c9.value);

  C c10 = (._staticGetter);
  Expect.equals("Static getter", c10.value);

  C c11 = (._staticMethod());
  Expect.equals("Static method", c11.value);

  C c12 = (._instances[0]);
  Expect.equals("one", c12.value);

  C c13 = (._("_"));
  Expect.equals("_", c13.value);

  C c14 = (._foo("foo"));
  Expect.equals("foo", c14.value);

  C c15 = (._bar("bar"));
  Expect.equals("bar", c15.value);

  C c16 = (._baz("baz"));
  Expect.equals("baz", c16.value);
}
