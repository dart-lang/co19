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
/// Case ⟨Getters⟩. Determine whether there exists a non-empty set N ⊆ 1..q such
/// that for each i ∈ N, the return type of mi is a subtype of the return type
/// of mj for each j ∈ 1..q. If no such set exists, the computation of the
/// combined member signature failed.
///
/// @description Checks that it is a compile-time error if there is no signature
/// with the return type which is is a subtype of mj for each j ∈ 1..q.
/// @author sgrekhov22@gmail.com

class I1 {
  String get m => "1";
}

class I2 {
  int get m => 2;
}

abstract class C implements I1, I2 {}
//             ^
// [analyzer] unspecified
// [cfe] unspecified

mixin M implements I1, I2 {
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
}
