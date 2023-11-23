// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Boolean conversion is defined by the function
///   (bool v){
///      assert(v != null);
///      return identical(v, true);
///    }(o)
/// @description Checks that objects that are not bool and not null are
/// not converted to boolean. It's a compile time error
/// @author msyabro
/// @Issue 27277


import '../../../../Utils/expect.dart';

class A {}

main() {
  Expect.isFalse(new Object() && true);
//               ^
// [analyzer] unspecified
// [cfe] unspecified
  Expect.isFalse(0 && true);
//               ^
// [analyzer] unspecified
// [cfe] unspecified
  Expect.isFalse(1 && true);
//               ^
// [analyzer] unspecified
// [cfe] unspecified
  Expect.isFalse("" && true);
//               ^
// [analyzer] unspecified
// [cfe] unspecified
  Expect.isFalse([1, 2, 3] && true);
//               ^
// [analyzer] unspecified
// [cfe] unspecified
  Expect.isFalse({"k1": 1} && true);
//               ^
// [analyzer] unspecified
// [cfe] unspecified
  Expect.isFalse(new A() && true);
//               ^
// [analyzer] unspecified
// [cfe] unspecified
  Expect.isFalse((() => 1) && true);
//               ^
// [analyzer] unspecified
// [cfe] unspecified
}
