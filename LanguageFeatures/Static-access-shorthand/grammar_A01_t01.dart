// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We introduce grammar productions of the form:
/// ```
/// <primary> ::= ...                      -- all current productions
///     | <staticMemberShorthand>
///
/// <constantPattern> ::=  ...             -- all current productions
///     | <staticMemberShorthand>
///
/// <staticMemberShorthand> ::=
///       '.' (<identifier> | 'new')                      -- shorthand qualified name
///     | 'const' '.' (<identifier> | 'new') <arguments>  -- shorthand object creation
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
}
