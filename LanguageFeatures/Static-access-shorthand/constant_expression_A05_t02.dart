// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given an expression that is a prefix of
/// `<staticMemberShorthandHead> <selector>*`, whose assigned shorthand context
/// denotes a declaration D, and where the identifier or `new` of the
/// `<staticMemberShorthandHead>` denotes a static declaration or constructor
/// declaration S when looked up on D.
/// ...
/// - An expression of the form `.id<typeArguments>` not followed by an
///   `<arguments>` selector is a constant expression if the type argument
///   clauses are all constant type expressions, and S declares a corresponding
///   static function.
///
/// @description Checks that an expression of the form `'.'id<typeArguments>`
/// not followed by an `<arguments>` selector is not a constant expression if
/// S declares a corresponding static function but the type clauses are not all
/// constant type expressions.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class C<T> {
  static String foo<X>() => "C<$X>";

  @override
  bool operator ==(Object other) {
    if (other is Function) {
      Expect.equals("C<int>", other());
      Expect.equals(C.foo<int>, other);
      return identical(C.foo<int>, other);
    }
    return false;
  }
}

mixin M<T extends num> {
  static String foo<X>() => "M<$X>";

  @override
  bool operator ==(Object other) {
    if (other is Function) {
      Expect.equals("M<int>", other());
      Expect.equals(M.foo<int>, other);
      return identical(M.foo<int>, other);
    }
    return false;
  }
}
class MA<T extends num> = Object with M<T>;

void test<T extends num>() {
  Expect.isFalse(C() == .foo<T>);
  Expect.isFalse(C<int>() == .foo<T>);
  Expect.isFalse((MA() as M) == .foo<T>);
  Expect.isFalse((MA<int>() as M<int>) == .foo<T>);
}

main() {
  test<int>();
}
