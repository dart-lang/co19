// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Evaluation of an if-null expression e of the form e1??e2 is
/// equivalent ... The static type of e is least upper bound of the
/// static type of e1 and the static type of e2 .
///
/// @description Check that static type of expression e1??e2 match with
/// static type (int) in assignment.
///
/// @author a.semenov@unipro.ru

main() {
  var x = (null ?? 2) as int?;
  var y = (x ?? 2.0) as num?;
  var d = 3.14 as double?;
  var s = "Lily was here" as String?;
  x = d ?? 1;
//    ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
//      ^
// [cfe] A value of type 'num' can't be assigned to a variable of type 'int?'.
  x = null ?? 1;
  x = null ?? null;
  x = x ?? 'aaa';
//   ^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
//      ^
// [cfe] A value of type 'Object' can't be assigned to a variable of type 'int?'.
  x = s ?? 1;
//    ^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
//      ^
// [cfe] A value of type 'Object' can't be assigned to a variable of type 'int?'.
  x = s ?? true;
//    ^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.INVALID_ASSIGNMENT
//      ^
// [cfe] A value of type 'Object' can't be assigned to a variable of type 'int?'.
  return x;
}
