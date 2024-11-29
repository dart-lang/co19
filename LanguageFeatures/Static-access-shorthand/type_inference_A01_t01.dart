// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion If a shorthand context type schema has the form `C` or `C<...>`,
/// and `C` is a type introduced by the type declaration `D`, then the shorthand
/// context denotes the type declaration `D`. If a shorthand context `S` denotes
/// a type declaration `D`, then so does a shorthand context of `S?` and
/// `FutureOr<S>`. Otherwise, a shorthand context does not denote any
/// declaration.
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

  static C<int> id<Y>(Y y) => C<int>(0);
}

mixin M<X> on C<X> {
  static M<int> id<Y>(Y y) => MA<int>(1);
}
class MA<T> = C<T> with M<T>;

enum E<X> {
  e0(2);
  final X value;
  const E(this.value);

  static E<int> id<Y>() => E.e0;
}

extension type ET<X>(X v) {
  static ET<int> id<Y>(Y y) => ET<int>(3);
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

  M m1 = .id<String>();
  Expect.equals(1, m1.value);

  M<int> m2 = .id<String>();
  Expect.equals(1, m2.value);

  M? m3 = .id<String>();
  Expect.equals(1, m3.value);

  M<int>? m4 = .id<String>("m4");
  Expect.equals(1, m4.value);

  E e1 = .id<String>();
  Expect.equals(E.e1, e1);

  E<int> e2 = .id<String>();
  Expect.equals(2, e2.value);

  E? e3 = .id<String>();
  Expect.equals(E.e0, e3);

  E<int>? e4 = .id<String>();
  Expect.equals(2, e4.value);

  ET et1 = .id<String>();
  Expect.equals(3, et1.v);

  ET<int> et2 = .id<String>();
  Expect.equals(3, et2.v);

  ET? et3 = .id<String>();
  Expect.equals(3, et3.v);

  ET<String>? et4 = .id<String>();
  Expect.equals(3, et4.v);
}
