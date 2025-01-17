// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
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
/// declaration `D`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import '../../Utils/expect.dart';

class C<X> {
  X value;
  C(this.value);

  static C<int> id<Y>() => C<int>(0);
}

mixin M<X> on C<X> {
  static M<int> id<Y>() => MA<int>(1);
}
class MA<T> = C<T> with M<T>;

enum E<X> {
  e0(2);
  final X value;
  const E(this.value);

  static E<int> id<Y>() => E.e0;
}

extension type ET<X>(X v) {
  static ET<int> id<Y>() => ET<int>(3);
}

main() {
  C c1 = .id<String>();
  Expect.equals(0, c1.value);

  C<int> c2 = .id<String>();
  Expect.equals(0, c2.value);

  C? c3 = .id<String>();
  Expect.equals(0, c3.value);

  C<int>? c4 = .id<String>();
  Expect.equals(0, c4.value);

  C<int?> c5 = .id<String>();
  Expect.equals(0, c5.value);

  M m1 = .id<String>();
  Expect.equals(1, m1.value);

  M<int> m2 = .id<String>();
  Expect.equals(1, m2.value);

  M? m3 = .id<String>();
  Expect.equals(1, m3.value);

  M<int>? m4 = .id<String>();
  Expect.equals(1, m4.value);

  M<int?> m5 = .id<String>();
  Expect.equals(1, m5.value);

  E e1 = .id<String>();
  Expect.equals(E.e1, e1);

  E<int> e2 = .id<String>();
  Expect.equals(2, e2.value);

  E? e3 = .id<String>();
  Expect.equals(E.e0, e3);

  E<int>? e4 = .id<String>();
  Expect.equals(2, e4.value);

  E<int?> e5 = .id<String>();
  Expect.equals(2, e5.value);

  ET et1 = .id<String>();
  Expect.equals(3, et1.v);

  ET<int> et2 = .id<String>();
  Expect.equals(3, et2.v);

  ET? et3 = .id<String>();
  Expect.equals(3, et3.v);

  ET<int>? et4 = .id<String>();
  Expect.equals(3, et4.v);

  ET<int?> et5 = .id<String>();
  Expect.equals(3, et5.v);
}
