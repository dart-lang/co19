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
/// Case ⟨Failing mixtures⟩. If M0 contains at least one getter signature and at
/// least one non-getter signature, the computation of the combined member
/// signature failed
///
/// @description Checks that it is a compile-time error if a class has a getter
/// and non-getter signature with the same name
/// @author sgrekhov22@gmail.com

mixin class I1 {
  int m() => 1;
}

class I2 {
  int get m => 2;
}

class C extends I1 implements I2 {
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

mixin M on I1 implements I2 {
//    ^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  print(C);
  print(M);
}
