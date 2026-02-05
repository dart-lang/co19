// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Helper library for type inference tests
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=dot-shorthands

class _C<T extends num> {
  final T value;
  _C(this.value);
  const _C.foo(this.value);
  factory _C.bar(T v) = _C;
  const factory _C.baz(T v) = _C.foo;

  static _C get staticGetter => _C(0);
  static _C staticMethod<X extends num>() => _C<X>(42 as X);
  static List<_C> instances = [_C(1), _C(2)];
}

mixin _M {
  static _M get staticGetter => _MA();
  static _M staticMethod<X extends num>() => _MA();
  static List<_M> instances = [_MA()];
}

enum _E<T extends num> {
  e0;

  static _E get staticGetter => _E.e0;
  static _E staticMethod<X extends num>() => _E.e0;
  static List<_E> instances = [_E.e0];
}

extension type _ET<T extends num>._(int value) {
  _ET(this.value);
  const _ET.foo(this.value);
  factory _ET.bar(int v) = _ET;
  const factory _ET.baz(int v) = _ET.foo;

  static _ET get staticGetter => _ET(0);
  static _ET staticMethod<X extends num>() => _ET<X>(42);
  static List<_ET> instances = [_ET(1), _ET(2)];
}

class _MA = Object with _M;

void cContextProvider(_C _) {}
void mContextProvider(_M _) {}
void eContextProvider(_E _) {}
void etContextProvider(_ET _) {}

typedef PublicC = _C;
typedef PublicM = _M;
typedef PublicE = _E;
typedef PublicET = _ET;

void cPublicContextProvider(PublicC _) {}
void mPublicContextProvider(PublicM _) {}
void ePublicContextProvider(PublicE _) {}
void etPublicContextProvider(PublicET _) {}
