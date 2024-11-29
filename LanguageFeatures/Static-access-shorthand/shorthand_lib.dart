// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Common library for static access shorthand tests.
///
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=enum-shorthands

class C<T> {
  T t;
  C(this.t);

  static C<int> get id1 => C(1);
  static C<X> id2<X>(X x) => C<X>(x);
  static X id3<X>(X x) => x;
}

typedef CAlias<T> = C<T>;
typedef CInt = C<int>;

mixin M<T> on C<T> {
  static M<int> get id1 => MC(2);
  static M<X> id2<X>(X x) => MC<X>(x);
  static X id3<X>(X x) => x;
}

class MC<T> = C<T> with M<T>;

typedef MAlias<T> = M<T>;
typedef MInt = M<int>;

enum E<T> {
  e1(3), e2("3");
  final T t;
  const E(this.t);

  static E<int> get id1 => E.e1;
  static E<String> id2() => E.e2;
  static X id3<X>(X x) => x;
}

typedef EAlias<T> = E<T>;
typedef EInt = E<int>;

extension type ET<T>(T t) {
  static ET<int> get id1 => ET(4);
  static ET<X> id2<X>(X x) => ET<X>(x);
  static X id3<X>(X x) => x;
}

typedef ETAlias<T> = ET<T>;
typedef ETInt = ET<int>;

List<int> foo(List<int> list) => list;
