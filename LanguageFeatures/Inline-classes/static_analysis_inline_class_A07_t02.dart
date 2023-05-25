// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if an inline type is used as a
/// superinterface of a class or a mixin, or if an inline type is used to derive
/// a mixin.
///
/// @description Checks that it is not an error if an inline type is used as a
/// type parameter of a superinterface of a class or a mixin
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

inline class V {
  final int id = 0;
  V();
}

class A<T> {}

class C1 extends A<V> {}

class C2 implements A<V> {}

mixin M on A<V> {}

main() {
  print(V);
  print(C1);
  print(C2);
  print(M);
}
