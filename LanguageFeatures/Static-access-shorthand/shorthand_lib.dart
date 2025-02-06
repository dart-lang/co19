// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Common library for static access shorthand tests.
///
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

class C<T> {
  final T t;
  const C(this.t);

  static C<int> get id1 => C(1);
  static C<X> id2<X>(X x) => C<X>(x);
  static X id3<X>(X x) => x;
  static const C<int> answer = const C(42);
}

typedef CAlias<T> = C<T>;
typedef CInt = C<int>;

mixin M<T> on C<T> {
  static M<int> get id1 => MC(2);
  static M<X> id2<X>(X x) => MC<X>(x);
  static X id3<X>(X x) => x;
  static const M<int> answer = const MC<int>(42);
}

class MC<T> extends C<T> with M<T> {
  const MC(super.t);
}

typedef MAlias<T> = M<T>;
typedef MInt = M<int>;

enum E<T> {
  e1(3), e2("3"), e3(42);
  final T t;
  const E(this.t);

  static E<int> get id1 => E.e1;
  static E<String> id2() => E.e2;
  static X id3<X>(X x) => x;
  static const E<int> answer = E.e3;
}

typedef EAlias<T> = E<T>;
typedef EInt = E<int>;

extension type const ET<T extends num>(T t) implements num {
  static ET<int> get id1 => ET(4);
  static ET<X> id2<X extends num>(X x) => ET<X>(x);
  static X id3<X>(X x) => x;
  static const ET<int> answer = const ET<int>(42);
}

typedef ETAlias<T extends num> = ET<T>;
typedef ETInt = ET<int>;

List<int> foo(List<int> list) => list;
