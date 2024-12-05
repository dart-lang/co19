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
/// @description Checks that static members of a class, mixin, enum or extension
/// type can be accessed using the static access short syntax of the form
/// `await <staticMemberShorthand>`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import 'dart:async';
import '../../Utils/expect.dart';

class C {
  final String value;
  C(this.value);
  const C.foo(this.value);

  static FutureOr<C> get staticGetter => C("C: static getter");
  static FutureOr<C> staticMethod() => C("C; static method");
  static FutureOr<List<C>> instances = [C("one"), C("two")];
}

mixin M on C {
  static M get staticGetter => CM("M: static getter");
  static M staticMethod() => CM("M: static method");
  static List<M> instances = [CM("M: one"), CM("M: two")];
}
class CM = C with M;

enum E {
  v1("v1"), v2("v2");

  final String value;
  const E(this.value);

  static FutureOr<E> get staticGetter => v1;
  static FutureOr<E> staticMethod() => v2;
}

extension type ET(int v) {
  static FutureOr<ET> get staticGetter => ET(1);
  static FutureOr<ET> staticMethod() => ET(2);
  static FutureOr<List<ET>> instances = [ET(0), ET(1)];
}

main() async {
  C c1 = await .staticGetter;
  Expect.equals("C: static getter", c1.value);

  C c2 = await .staticMethod();
  Expect.equals("C: static method", c2.value);

  C c3 = await .instances[0];
  Expect.equals("one", c3.value);

  M m1 = await .staticGetter;
  Expect.equals("M: static getter", m1.value);

  M m2 = await .staticMethod();
  Expect.equals("M: static method", m2.value);

  M m3 = await .instances[0];
  Expect.equals("M: one", m3.value);

  E e0 = await .v1;
  Expect.equals(E.v1, e0);

  E e1 = await .staticGetter;
  Expect.equals("v1", e1.value);

  E e2 = await .staticMethod();
  Expect.equals("v2", e2.value);

  E e3 = await .values[1];
  Expect.equals(E.v2, e3);

  ET et1 = await .staticGetter;
  Expect.equals(1, et1.v);

  ET et2 = await .staticMethod();
  Expect.equals(2, et2.v);

  ET et3 = await .instances[0];
  Expect.equals(0, et3.v);
}
