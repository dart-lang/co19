// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// @dart = 2.9

/// @description Check that if type T0 not a subtype of a type T1, then instance
/// of T0 cannot be used as a return value of type T1. Return value is tested.
/// @author sgrekhov@unipro.ru
/// @author ngl@unipro.ru

@T1 returnValueFunc() => t0Instance;
//                       ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

class ReturnValueTest {
  static @T1 staticTestMethod() => t0Instance;
//                                 ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  @T1 testMethod() => t0Instance;
//                    ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified

  @T1 get testGetter => t0Instance;
//                      ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

main() {
  returnValueFunc();

  @T1 returnValueLocalFunc() => t0Instance;
//                              ^^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  returnValueLocalFunc();

  ReturnValueTest.staticTestMethod();
  new ReturnValueTest().testMethod();
  new ReturnValueTest().testGetter;
}
