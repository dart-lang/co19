// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given an expression that is a prefix of
/// `<staticMemberShorthandHead> <selector>*`, whose assigned shorthand context
/// denotes a declaration D, and where the identifier or `new` of the
/// `<staticMemberShorthandHead>` denotes a static declaration or constructor
/// declaration S when looked up on D.
/// ...
/// - An expression of the form `.<identifier>` that is not followed by an
///   `<argumentPart>`, is a constant expression if S declares a static method
///   or constructor with base name `<identifier>`, and either type inference
///   has not added type arguments as a generic function instantiation coercion
///   to the method, or to the target class for a constructor, or the added type
///   arguments are constant types.
///
/// @description Checks that an expression of the form `'.' <identifier>` that
/// is not followed by an `<argumentPart>` is not a constant expression if the
/// type argument is not a constant expression.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class C {
  static String foo<X>() => "C<$X>";

  @override
  bool operator ==(Object other) {
    if (other is Function) {
      Expect.equals("C<String>", other());
      Expect.equals(C.foo<String>, other);
      return identical(C.foo<String>, other);
    }
    return true;
  }
}

mixin M {
  static String foo<X>() => "M<$X>";

  @override
  bool operator ==(Object other) {
    if (other is Function) {
      Expect.equals("M<String>", other());
      Expect.equals(M.foo<String>, other);
      return identical(M.foo<String>, other);
    }
    return true;
  }
}
class MO = Object with M;

class A {
  @override
  bool operator ==(Object other) {
    if (other is Function) {
      Expect.equals("ET<String>", other());
      Expect.equals(ET.foo<String>, other);
      return identical(ET.foo<String>, other);
    }
    return true;
  }
}

extension type ET(A _) implements A {
  static String foo<X>() => "ET<$X>";
}

test<T>() {
  // Just check that it works and doesn't crash. We don't check the result of
  // `identical()` here because some compilers may canonicalize the torn-off
  C() == .foo<T>;
  (MO() as M) == .foo<T>;
  ET(A()) == .foo<T>;
}

main() {
  test<String>();
}
