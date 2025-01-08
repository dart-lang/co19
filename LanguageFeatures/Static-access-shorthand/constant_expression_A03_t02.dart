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
/// @description Checks that an expression of the form `'.'<identifier>` that is
/// not followed by an `<argumentPart>` is a constant expression if the
/// appropriate declaration declares a static method or constructor with base
/// name `<identifier>`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class C1<T> {
  C1.id();

  @override
  bool operator ==(Object other) {
    return identical(C1.id, other);
  }
}

class C2<T extends num> {
  static String foo<X>() => "C2<$X>";

  @override
  bool operator ==(Object other) {
    if (other is Function) {
      Expect.equals("C2<dynamic>", other());
      return identical(C2.foo, other);
    }
    return false;
  }
}

class C3<T> {
  static String foo<X extends num>() => "C3<$X>";

  @override
  bool operator ==(Object other) {
    if (other is Function) {
      Expect.equals("C3<num>", other());
      return identical(C3.foo, other);
    }
    return false;
  }
}

mixin M1<T extends num> {
  static String foo<X>() => "M1<$X>";

  @override
  bool operator ==(Object other) {
    if (other is Function) {
      Expect.equals("M1<dynamic>", other());
      return identical(M1.foo, other);
    }
    return false;
  }
}
class MA1<T extends num> = Object with M1<T>;

mixin M2<T> {
  static String foo<X extends num>() => "M2<$X>";

  @override
  bool operator ==(Object other) {
    if (other is Function) {
      Expect.equals("M2<num>", other());
      return identical(M2.foo, other);
    }
    return false;
  }
}
class MA2<T> = Object with M2<T>;

main() {
  Expect.isTrue(C1.id() == .id);
  Expect.isTrue(C1<String>.id() == .id);
  Expect.isTrue(C2() == .foo);
  Expect.isTrue(C2<int>() == .foo);
  Expect.isTrue(C3() == .foo);
  Expect.isTrue(C3<String>() == .foo);

  Expect.isTrue((MA1() as M1) == .foo);
  Expect.isTrue((MA1<int>() as M1<int>) == .foo);
  Expect.isTrue((MA2() as M2) == .foo);
  Expect.isTrue((MA2<String>() as M2<String>) == .foo);
}
