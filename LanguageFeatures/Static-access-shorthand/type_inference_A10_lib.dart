// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Helper library for type inference tests
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

class C {
  C();
  const C._foo();
  factory C._bar() = C;
  const factory C._baz() = C._foo;

  static C get _staticGetter => C();
  static C _staticMethod<X extends num>() => C();
  static List<C> _instances = [C()];
}

mixin M {
  static M get _staticGetter => MA();
  static M _staticMethod<X extends num>() => MA();
  static List<M> _instances = [MA()];
}

enum E {
  e0, _e1;

  static E get _staticGetter => E.e0;
  static E _staticMethod<X extends num>() => E.e0;
  static List<E> _instances = [E.e0];
}

extension type ET(int value) {
  ET._(this.value);
  const ET._foo(this.value);
  factory ET._bar(int v) = ET;
  const factory ET._baz(int v) = ET._foo;

  static ET get _staticGetter => ET(0);
  static ET _staticMethod<X extends num>() => ET(42);
  static List<ET> _instances = [ET(1), ET(2)];
}

class MA = Object with M;
