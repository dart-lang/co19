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
/// @description Checks that static members and values of an enum can be
/// accessed using the static access short syntax.
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

enum E {
  v1("v1"), v2("v2");

  final String value;
  const E(this.value);

  static E get staticGetter => v1;
  static E staticMethod() => v2;
}

main() {
  E e0 = .v1;
  Expect.equals(E.v1, e0);

  E e1 = .staticGetter;
  Expect.equals("v1", e1.value);

  E e2 = .staticMethod();
  Expect.equals("v2", e2.value);

  E e3 = E.values[1];
  Expect.equals(E.v2, e3);
}
