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
/// is not followed by an `<argumentPart>` is a constant expression if the
/// appropriate declaration declares a static method or constructor with base
/// name `<identifier>`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

import '../../Utils/expect.dart';

class C1<T> {
  C1.id();

  // Shorthand context of the right hand of `e1 == .e2` is `e1`, so we use
  // overloaded `==` operator to check if `.e2` is really a constant (constants
  // are canonicalized to be the same object and the call of `identical()`
  // should confirm it).
  @override
  bool operator ==(Object other) => identical(C1.id, other);
}

class C2<T extends num> {
  static Type foo<X>() => X;

  @override
  bool operator ==(Object other) {
    if (other is Function) {
      Expect.equals(dynamic, other());
      return identical(C2.foo, other);
    }
    return false;
  }
}

class C3<T> {
  static Type foo<X extends num>() => C3<X>;

  @override
  bool operator ==(Object other) {
    if (other is Function) {
      Expect.equals(C3<num>, other());
      return identical(C3.foo, other);
    }
    return false;
  }
}

mixin M1<T extends num> {
  static Type foo<X>() => X;

  @override
  bool operator ==(Object other) {
    if (other is Function) {
      Expect.equals(dynamic, other());
      return identical(M1.foo, other);
    }
    return false;
  }
}
class MO1<T extends num> = Object with M1<T>;

mixin M2<T> {
  static Type foo<X extends num>() => M2<X>;

  @override
  bool operator ==(Object other) {
    if (other is Function) {
      Expect.equals(M2<num>, other());
      return identical(M2.foo, other);
    }
    return false;
  }
}
class MO2<T> = Object with M2<T>;

class A1 {
  @override
  bool operator ==(Object other) => identical(ET1.id, other);
}

extension type ET1<T>.id(A1 _) implements A1 {}

class A2 {
  @override
  bool operator ==(Object other) {
    if (other is Function) {
      Expect.equals(dynamic, other());
      return identical(ET2.foo, other);
    }
    return false;
  }
}

extension type ET2<T extends num>(A2 _) implements A2 {
  static Type foo<X>() => X;
}

class A3 {
  @override
  bool operator ==(Object other) {
    if (other is Function) {
      Expect.equals(ET3<num>, other());
      return identical(ET3.foo, other);
    }
    return false;
  }
}

extension type ET3<T>(A3 _) implements A3 {
  static Type foo<X extends num>() => ET3<X>;
}

main() {
  Expect.isTrue(C1.id() == .id);
  Expect.isTrue(C1<String>.id() == .id);
  Expect.isTrue(C2() == .foo);
  Expect.isTrue(C2<int>() == .foo);
  Expect.isTrue(C3() == .foo);
  Expect.isTrue(C3<String>() == .foo);

  Expect.isTrue((MO1() as M1) == .foo);
  Expect.isTrue((MO1<int>() as M1<int>) == .foo);
  Expect.isTrue((MO2() as M2) == .foo);
  Expect.isTrue((MO2<String>() as M2<String>) == .foo);

  Expect.isTrue(ET1.id(A1()) == .id);
  Expect.isTrue(ET1<String>.id(A1()) == .id);
  Expect.isTrue(ET2(A2()) == .foo);
  Expect.isTrue(ET2<int>(A2()) == .foo);
  Expect.isTrue(ET3(A3()) == .foo);
  Expect.isTrue(ET3<String>(A3()) == .foo);
}
