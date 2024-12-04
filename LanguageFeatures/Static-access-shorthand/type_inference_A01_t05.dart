// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Declaration denoted by a type scheme A context type scheme is
/// said to denote a declaration in some cases. Not all context type schemes
/// denote a declaration.
/// If a type scheme `S`:
/// - has the form `C` or `C<typeArgs>` where `C` is a type introduced by a
///   declaration `D` which must therefore be a type-introducing declaration,
///   which currently means a class, mixin, enum or extension type declaration,
///   then `S` denotes the declaration `D`.
/// - has the form `S?` or `FutureOr<S>`, and the type scheme S denotes a
///   declaration D, then so does `S?/FutureOr<S>`. Only the "base type" of the
///   union type is considered, ensuring that a type scheme denotes at most one
///   declaration or static namespace.
/// - has any other form, including type variables, promoted type variables and
///   `_`, then the type scheme does not denote any declaration or namespace.
///
/// @description Checks that it is a compile-time error if a shorthand context
/// doesn't denote any declaration. Test promoted type variables.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

void topLevelFunction<T>(T t) {
  if (t is int) {
    T answer = .parse("42");
//             ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

class C<T> {
  T t;
  C(this.t);

  void test() {
    var x = this.t; // Local variable of type `T`, promotable.
    if (x is int) { // Promotes `x` to `T & int`
      x = .parse("42"); // Error, context `T & int` does not denote a declaration.
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

mixin M {
  void test<T>(T t) {
    if (t is int) { // Promotes `t` to `T & int`
      t = .parse("42"); // Error, context `T & int` does not denote a declaration.
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

enum E<T> {
  e0(42);
  final T t;
  const E(this.t);

  void test() {
    var x = this.t;
    if (x is int) {
      x = .parse("42");
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

extension type ET<T>(T t) {
  void test() {
    var x = this.t;
    if (x is int) {
      x = .parse("42");
//        ^
// [analyzer] unspecified
// [cfe] unspecified
    }
  }
}

main() {
  print(topLevelFunction);
  print(C);
  print(M);
  print(E);
  print(ET);
}
