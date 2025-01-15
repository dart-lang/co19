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
/// @description Checks that static members and constructors of an extension
/// type can be accessed using the static access short syntax.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

extension type ET1(int v) {
  const ET1.foo(this.v);
  ET1.bar(this.v);
  const factory ET1.baz(int v) = ET1.foo;

  static ET1 get staticGetter => ET1(1);
  static ET1 staticMethod() => ET1(2);
  static List<ET1> instances = [ET1(0), ET1(1)];
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

  ET1 et6 = .baz(6);
  Expect.equals(6, et6.v);

  ET1 et7 = const .baz(7);
  Expect.equals(7, et7.v);

  ET2 et8 = .baz(8);
  Expect.equals(8, et8.v);

  ET2 et9 = const .new(9);
  Expect.equals(9, et9.v);

  ET3 et10 = const .qux(10);
  Expect.equals(10, et10.v);

  ET3 et11 = .new(11);
  Expect.equals(11, et11.v);


  ET1 et20 = (.instances[0]);
  Expect.equals(0, et20.v);

  ET1 et21 = (.staticGetter);
  Expect.equals(1, et21.v);

  ET1 et22 = (.staticMethod());
  Expect.equals(2, et22.v);

  ET1 et23 = (.new(23));
  Expect.equals(23, et23.v);

  ET1 et24 = (.bar(24));
  Expect.equals(24, et24.v);

  ET1 et25 = (.baz(25));
  Expect.equals(25, et25.v);

  ET2 et26 = (.baz(26));
  Expect.equals(26, et26.v);

  ET3 et27 = (.new(27));
  Expect.equals(27, et27.v);
}
