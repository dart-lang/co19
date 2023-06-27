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
/// @description Checks that it is a compile-time error if a class has inherited
/// getter and non-getter with the same name
/// @author sgrekhov22@gmail.com
/// @issue 52620

class I1 {
  int m() => 1;
}

mixin class I2 {
  int get m => 2;
}

class C1 extends I1 with I2 {
//    ^^
// [analyzer] unspecified
// [cfe] unspecified
}

class C2 = I1 with I2;
//    ^^
// [analyzer] unspecified
// [cfe] unspecified

main() {
  print(C1);
  print(C2);
}
