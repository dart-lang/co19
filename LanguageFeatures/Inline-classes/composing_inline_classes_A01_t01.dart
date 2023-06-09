// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Assume that DV is an inline class declaration named Inline, and
/// V1 occurs as one of the <type>s in the <interfaces> of DV. In this case we
/// say that V1 is a superinterface of DV.
///
/// A compile-time error occurs if V1 is a type name or a parameterized type
/// which occurs as a superinterface in an inline class declaration DV, but V1
/// does not denote an inline type.
///
/// @description Checks that it is a compile-time error if superinterface of an
/// inline class is not an inline type
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

class I1 {}
class I2<T1, T2> {}

inline class V1 implements I1 {
//                         ^^
// [analyzer] unspecified
// [cfe] unspecified
  final int it;
  V1(this.it);
}

inline class V2<T1, T2 extends num?> implements I2<T1, T2> {
//                                              ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  final T1 id;
  V2(this.id);
}

main() {
  print(V1);
  print(V2);
}
