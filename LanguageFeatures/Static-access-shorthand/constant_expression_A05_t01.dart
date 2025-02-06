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
/// not followed by an `<arguments>` selector is a constant expression if the
/// type clauses are all constant type expressions, and S declares a
/// corresponding static function.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

import '../../Utils/expect.dart';

class C<T> {
  static String foo<X>() => "C<$X>";

  @override
  bool operator ==(Object other) {
    if (other is Function) {
      Expect.equals("C<String>", other());
      return identical(C.foo<String>, other);
    }
    return false;
  }
}

mixin M<T extends num> {
  static String foo<X>() => "M<$X>";

  @override
  bool operator ==(Object other) {
    if (other is Function) {
      Expect.equals("M<String>", other());
      return identical(M.foo<String>, other);
    }
    return false;
  }
}
class MO<T extends num> = Object with M<T>;

class A {
  @override
  bool operator ==(Object other) {
    if (other is Function) {
      Expect.equals("ET<String>", other());
      return identical(ET.foo<String>, other);
    }
    return false;
  }
}

extension type ET<T>(A _) implements A {
  static String foo<X>() => "ET<$X>";
}

main() {
  Expect.isTrue(C() == .foo<String>);
  Expect.isTrue(C<int>() == .foo<String>);

  Expect.isTrue((MO() as M) == .foo<String>);
  Expect.isTrue((MO<int>() as M<int>) == .foo<String>);

  Expect.isTrue(ET(A()) == .foo<String>);
  Expect.isTrue(ET<int>(A()) == .foo<String>);
}
