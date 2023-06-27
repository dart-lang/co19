// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Now we define combined member signatures. Let id be an
/// identifier, L a id, L, Ij , k library, I1, . . . , Ik a list of interfaces,
/// and M0 the set of all member signatures M0 from I1, . . . , Ik named id and
/// accessible to L. The combined member signature named id from I1, . . . , Ik
/// with respect to L is the member signature which is obtained as follows:
/// ...
/// M0 contains more than one member signature m1, . . . , mq.
/// ...
/// Case ⟨Methods and setters⟩. Determine whether there exists a non-empty set
/// N ⊆ 1..q such that for each i ∈ N, the return type of mi is a subtype of
/// the function type of mj for each j ∈ 1..q. If no such set exists, the
/// computation of the combined member signature failed.
///
/// @description Checks that it is a compile-time error if there is no signature
/// with the function type which is is a subtype of mj for each j ∈ 1..q.
/// @author sgrekhov22@gmail.com

class I1_1 {
  void m1(int i) {}
}

class I2_1 {
  void m1() {}
}

class I1_2 {
  void m2([int i = 0]) {}
}

class I2_2 {
  void m2({int i = 0}) {}
}

class I1_3<T> {
  void m3(T t) {}
}

class I2_3<T> {
  void m3(T t) {}
}

abstract class C1 implements I1_1, I2_1 {}
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

mixin M1 implements I1_1, I2_1 {
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract class C2 implements I1_2, I2_2 {}
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

mixin M2 implements I1_2, I2_2 {
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

abstract class C3 implements I1_3<int>, I2_3<String> {}
//             ^^
// [analyzer] unspecified
// [cfe] unspecified

mixin M3 implements I1_3<int>, I2_3<String> {
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C1);
  print(C2);
  print(C3);
  print(M1);
  print(M2);
  print(M3);
}
