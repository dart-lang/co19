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
/// @description Checks that an expression of the form `'.' id<typeArguments>`
/// not followed by an `<arguments>` selector is not a constant expression if
/// S declares a corresponding static function but the type clauses are not all
/// constant type expressions.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

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

class A {
  @override
  bool operator ==(Object other) {
    if (other is Function) {
      Expect.equals("ET<int>", other());
      return identical(ET.foo<String>, other);
    }
    return false;
  }
}

extension type ET<T>(A _) implements A {
  static String foo<X>() => "ET<$X>";
}

void test<T extends num>() {
  // Just check that it works and doesn't crash. We don't check the result of
  // `identical()` here because some compilers may canonicalize the torn-off
  C() == .foo<T>;
  C<int>() == .foo<T>;
  (MA() as M) == .foo<T>;
  (MA<int>() as M<int>) == .foo<T>;
  ET(A()) == .foo<T>;
  ET<int>(A()) == .foo<T>;
}

main() {
  test<int>();
}
