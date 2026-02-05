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
/// @description Checks that private static members of a mixin can be accessed
/// using the static access short syntax.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

import '../../Utils/expect.dart';

class C {
  static C get _staticGetter => C("C: static getter");
  static C _staticMethod() => C("C: static method");
  static List<C> _instances = [C("one"), C("two")];
  final String value;
  C(this.value);
}

mixin M on C {
  static M get _staticGetter => MC("M: static getter");
  static M _staticMethod() => MC("M: static method");
  static List<M> _instances = [MC("M: one"), MC("M: two")];
}

class MC = C with M;

main() {
  M m1 = ._staticGetter;
  Expect.equals("M: static getter", m1.value);

  M m2 = ._staticMethod();
  Expect.equals("M: static method", m2.value);

  M m3 = ._instances[0];
  Expect.equals("M: one", m3.value);
}
