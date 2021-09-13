// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An expression is constant if it is an explicit generic type
/// instantiation of a constant function object where the type argument is
/// constant
///
/// @description Check that an expression is constant if it is an explicit
/// generic type instantiation of a constant function object where the type
/// argument is constant
/// @author sgrekhov@unipro.ru

// SharedOptions=--enable-experiment=constructor-tearoffs

void f<X>(X x) {}

void main() {
  void g1<Y>() {
    const c1 = f<Y>;
//             ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  const c2 = g1<int>;
//           ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  void g2<Y extends num>() {
  const c3 = f<Y>;
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified
  }

  const c4 = g2<int>;
//           ^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
