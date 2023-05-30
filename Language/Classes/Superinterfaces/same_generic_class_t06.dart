// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if a class C has two superinterfaces
/// that are different instantiations of the same generic class
///
/// @description Checks that it is not an error if a class `C` has two
/// superinterfaces that are the same instantiation of the same generic class.
/// @author sgrekhov22@gmail.com

class A<T> {}

class B1<T> implements A<T> {}
class B2<T extends num> implements A<T> {}
class B3 implements A<int> {}

class C1 implements A<int>, B1<int> {}
class C2 implements A<num>, B2 {}
class C3 implements B1<int>, B3 {}
class C4 implements B1<int>, B2<int> {}
class C5<T extends num> implements B1<T>, B2<T> {}

main() {
  C1();
  C2();
  C3();
  C4();
  C5();
}
