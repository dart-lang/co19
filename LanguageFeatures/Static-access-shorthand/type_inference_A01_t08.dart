// Copyright (c) 2025, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A context type scheme is said to denote a declaration in some
/// cases. Not all context type schemes denote a declaration.
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
/// @description Checks that if a shorthand context type schema has one of the
/// forms `C`, `C<...>`, `C?`, or `C<...>?` and `C` is a type introduced by the
/// type declaration `D`, then the shorthand context denotes the type
/// declaration `D`. Test a class.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class C<T> {
  T value;
  C(this.value);
  C.id(this.value);
  factory C.f(T t) = C;

  static C<int> get staticGetter => C(4);
  static C<X> staticMethod<X>(X x) => C<X>(x);
  static C<String> instance = C("one");
}

main() {
  C? c1 = .new(1);
  Expect.equals(1, c1.value);

  C? c2 = .id(2);
  Expect.equals(2, c2.value);

  C<int>? c3 = .f(3);
  Expect.equals(3, c3.value);

  C<int>? c4 = .staticGetter;
  Expect.equals(4, c4.value);

  C? c5 = .staticGetter;
  Expect.equals(4, c5.value);

  C<int>? c6 = .staticMethod<int>(6);
  Expect.equals(6, c6.value);

  C? c7 = .staticMethod<int>(7);
  Expect.equals(7, c7.value);

  C<String>? c8 = .instance;
  Expect.equals("one", c8.value);

  C? c9 = .instance;
  Expect.equals("one", c9.value);
}
