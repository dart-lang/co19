// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Any use of a type `T` which is not well-bounded is a
/// compile-time error.
///
/// @description Checks that it is a compile-time error to call a generic
/// function with a type parameter which is not regular-bounded
/// @author iarkh@unipro.ru

void testme<X extends num>() {}

main() {
  testme<String>();
//^
// [cfe] Type argument 'String' doesn't conform to the bound 'num' of the type variable 'X' on 'testme'.
//       ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
  testme<dynamic>();
//^
// [cfe] Type argument 'dynamic' doesn't conform to the bound 'num' of the type variable 'X' on 'testme'.
//       ^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
  testme<void>();
//^
// [cfe] Type argument 'void' doesn't conform to the bound 'num' of the type variable 'X' on 'testme'.
//       ^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
  testme<Object>();
//^
// [cfe] Type argument 'Object' doesn't conform to the bound 'num' of the type variable 'X' on 'testme'.
//       ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.TYPE_ARGUMENT_NOT_MATCHING_BOUNDS
}
