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
/// @description Checks that static members and constructors of a class can be
/// accessed using the static access short syntax.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class C {
  final String value;
  C(this.value);
  const C.foo(this.value);
  factory C.bar(String v) = C;
  const factory C.baz(String v) = C.foo;

  static C get staticGetter => C("Static getter");
  static C staticMethod() => C("Static method");
  static List<C> instances = [C("one"), C("two")];
}

main() {
  C c1 = .staticGetter;
  Expect.equals("Static getter", c1.value);

  C c2 = .staticMethod();
  Expect.equals("Static method", c2.value);

  C c3 = .instances[0];
  Expect.equals("one", c3.value);

  C c4 = .new("new");
  Expect.equals("new", c4.value);

  C c5 = .foo("foo");
  Expect.equals("foo", c5.value);

  C c6 = const .foo("const foo");
  Expect.equals("const foo", c6.value);

  C c7 = .bar("bar");
  Expect.equals("bar", c7.value);

  C c8 = .baz("baz");
  Expect.equals("baz", c8.value);

  C c9 = const .baz("const baz");
  Expect.equals("const baz", c9.value);

  C c10 = (.staticGetter);
  Expect.equals("Static getter", c10.value);

  C c11 = (.staticMethod());
  Expect.equals("Static method", c11.value);

  C c12 = (.instances[0]);
  Expect.equals("one", c12.value);

  C c13 = (.new("new"));
  Expect.equals("new", c13.value);

  C c14 = (.foo("foo"));
  Expect.equals("foo", c14.value);

  C c15 = (.bar("bar"));
  Expect.equals("bar", c15.value);

  C c16 = (.baz("baz"));
  Expect.equals("baz", c16.value);
}
