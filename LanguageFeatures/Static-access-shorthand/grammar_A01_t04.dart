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
/// @description Checks that static members and constructors of an extension
/// type can be accessed using the static access short syntax.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

extension type ET1(int v) {
  const ET1.foo(this.v);
  ET1.bar(this.v);

  static ET1 get staticGetter => ET1(1);
  static ET1 staticMethod() => ET1(2);
  static ET1 instances = [ET1(0), ET1(1)];
}

extension type ET2.baz(int v) {
  const ET2(this.v);
}

extension type const ET3.qux(int v) {
  ET3.new(this.v);
}

main() {
  ET1 et0 = .instances[0];
  Expect.equals(0, et0.v);

  ET1 et1 = .staticGetter;
  Expect.equals(1, et1.v);

  ET1 et2 = .staticMethod();
  Expect.equals(2, et2.v);

  ET1 et3 = .new(3);
  Expect.equals(3, et3.v);

  ET1 et4 = const .foo(4);
  Expect.equals(4, et4.v);

  ET1 et5 = .bar(5);
  Expect.equals(5, et5.v);

  ET2 et6 = .baz(6);
  Expect.equals(6, et6.v);

  ET2 et7 = const .new(7);
  Expect.equals(7, et7.v);

  ET3 et8 = const .qux(8);
  Expect.equals(8, et8.v);

  ET3 et9 = .new(9);
  Expect.equals(9, et9.v);
}
