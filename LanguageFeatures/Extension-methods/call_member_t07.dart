// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We do not allow implicit tear-off of an extension call method in a
/// function typed context.
///
/// @description Check that implicit tear-off of an extension call method in a
/// function typed context is a compile-time error
/// @author sgrekhov@unipro.ru



extension on int {
  String call(int v) => "Result: $v";
}

String Function(int) from1 = 1;
//                           ^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'int' can't be assigned to a variable of type 'String Function(int)'.

main() {
  String Function(int) from2 = 2;
//                             ^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
// [cfe] A value of type 'int' can't be assigned to a variable of type 'String Function(int)'.
}
