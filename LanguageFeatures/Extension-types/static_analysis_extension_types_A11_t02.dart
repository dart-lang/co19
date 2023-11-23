// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A compile-time error occurs if an extension type is used as a
/// superinterface of a class, mixin, or enum declaration, or if an extension
/// type is used in a mixin application as a superclass or as a mixin.
///
/// @description Checks that it is not an error if an extension type is used as
/// a type parameter of a superinterface of a class or a mixin
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

extension type V(int id) {}

class A<T> {}

class C1 extends A<V> {}

class C2 implements A<V> {}

mixin M on A<V> {}

enum E implements A<V> {
  e1, e2;
}

main() {
  print(V);
  print(C1);
  print(C2);
  print(M);
  print(E);
}
