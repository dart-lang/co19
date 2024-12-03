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
/// <staticMemberShorthand> ::= <staticMemberShorthandHead> <selector*>
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
/// @description Checks that static members of a mixin can be accessed using the
/// static access short syntax.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class C {
  final String value;
  C(this.value);
  const C.foo(this.value);

  static C get staticGetter => C("C: static getter");
  static C staticMethod() => C("C: static method");
  static List<C> instances = [C("one"), C("two")];
}

mixin M on C {
  static M get staticGetter => CM("M: static getter");
  static M staticMethod() => CM("M: static method");
  static List<M> instances = [CM("M: one"), CM("M: two")];
}

class CM = C with M;

main() {
  M m1 = .staticGetter;
  Expect.equals("M: static getter", m1.value);

  M m2 = .staticMethod();
  Expect.equals("M: static method", m2.value);

  M m3 = .instances[0];
  Expect.equals("M: one", m3.value);
}
