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
/// forms `FutureOr<C>`, `FutureOr<C<...>>`, `FutureOr<C>?`,
/// `FutureOr<C<...>>?`, `FutureOr<C?>`, `FutureOr<C<...>?>`, `FutureOr<C?>?` or
/// `FutureOr<C<...>?>?` and `C` is a type introduced by the type declaration
/// `D`, then the shorthand context denotes the type declaration `D`.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

import 'dart:async';
import '../../Utils/expect.dart';

class C<X> {
  X value;
  C(this.value);

  static FutureOr<C<int>> id<Y>() => C<int>(0);
}

mixin M<X> on C<X> {
  static FutureOr<M<int>> id<Y>() => MC<int>(1);
}
class MC<T> = C<T> with M<T>;

enum E<X> {
  e0(2);
  final X value;
  const E(this.value);

  static FutureOr<E<int>> id<Y>() => E.e0;
}

extension type ET<X>(X v) {
  static FutureOr<ET<int>> id<Y>() => ET<int>(3);
}

main() async {
  FutureOr<C> c1 = .id<String>();
  Expect.equals(0, (await c1).value);

  FutureOr<C<int>> c2 = .id<String>();
  Expect.equals(0, (await c2).value);

  FutureOr<C>? c3 = .id<String>();
  Expect.equals(0, (await c3).value);

  FutureOr<C<int>>? c4 = .id<String>();
  Expect.equals(0, (await c4).value);

  FutureOr<C?> c5 = .id<String>();
  Expect.equals(0, (await c5)?.value);

  FutureOr<C<int>?> c6 = .id<String>();
  Expect.equals(0, (await c6)?.value);

  FutureOr<C?>? c7 = .id<String>();
  Expect.equals(0, (await c7)?.value);

  FutureOr<C<int>?>? c8 = .id<String>();
  Expect.equals(0, (await c8)?.value);

  FutureOr<FutureOr<C>> c9 = .id<String>();
  Expect.equals(0, (await (await c9)).value);

  FutureOr<M> m1 = .id<String>();
  Expect.equals(1, (await m1).value);

  FutureOr<M<int>> m2 = .id<String>();
  Expect.equals(1, (await m2).value);

  FutureOr<M>? m3 = .id<String>();
  Expect.equals(1, (await m3).value);

  FutureOr<M<int>>? m4 = .id<String>();
  Expect.equals(1, (await m4).value);

  FutureOr<M?> m5 = .id<String>();
  Expect.equals(1, (await m5)?.value);

  FutureOr<M<int>?> m6 = .id<String>();
  Expect.equals(1, (await m6)?.value);

  FutureOr<M?>? m7 = .id<String>();
  Expect.equals(1, (await m7)?.value);

  FutureOr<M<int>?>? m8 = .id<String>();
  Expect.equals(1, (await m8)?.value);

  FutureOr<FutureOr<M>> m9 = .id<String>();
  Expect.equals(1, (await (await m9)).value);

  FutureOr<E> e1 = .id<String>();
  Expect.equals(E.e0, await e1);

  FutureOr<E<int>> e2 = .id<String>();
  Expect.equals(E.e0, await e2);

  FutureOr<E>? e3 = .id<String>();
  Expect.equals(E.e0, await e3);

  FutureOr<E<int>>? e4 = .id<String>();
  Expect.equals(E.e0, await e4);

  FutureOr<E?> e5 = .id<String>();
  Expect.equals(E.e0, await e5);

  FutureOr<E<int>?> e6 = .id<String>();
  Expect.equals(E.e0, await e6);

  FutureOr<E?>? e7 = .id<String>();
  Expect.equals(E.e0, await e7);

  FutureOr<E<int>?>? e8 = .id<String>();
  Expect.equals(E.e0, await e8);

  FutureOr<FutureOr<E>> e9 = .id<String>();
  Expect.equals(E.e0, await (await e9));

  FutureOr<ET> et1 = .id<String>();
  Expect.equals(3, (await et1).v);

  FutureOr<ET<int>> et2 = .id<String>();
  Expect.equals(3, (await et2).v);

  FutureOr<ET>? et3 = .id<String>();
  Expect.equals(3, (await et3).v);

  FutureOr<ET<int>>? et4 = .id<String>();
  Expect.equals(3, (await et4).v);

  FutureOr<ET?> et5 = .id<String>();
  Expect.equals(3, (await et5)?.v);

  FutureOr<ET<int>?> et6 = .id<String>();
  Expect.equals(3, (await et6)?.v);

  FutureOr<ET?>? et7 = .id<String>();
  Expect.equals(3, (await et7)?.v);

  FutureOr<ET<int>?>? et8 = .id<String>();
  Expect.equals(3, (await et8)?.v);

  FutureOr<FutureOr<ET>> et9 = .id<String>();
  Expect.equals(3, (await (await et9)).value);
}
