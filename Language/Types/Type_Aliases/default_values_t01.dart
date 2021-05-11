// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if any default values are specified in
/// the signature of a function type in a type alias
/// @description Checks that it is a compile-time error if any default values are
/// specified in the signature of a function type in a type alias
/// @author sgrekhov@unipro.ru


typedef void F1(String s = "");
//                       ^
// [analyzer] SYNTACTIC_ERROR.NAMED_PARAMETER_OUTSIDE_GROUP
// [cfe] Non-optional parameters can't have a default value.
typedef String F2(String s, int i = -1);
//                                ^
// [analyzer] SYNTACTIC_ERROR.NAMED_PARAMETER_OUTSIDE_GROUP
// [cfe] Non-optional parameters can't have a default value.
typedef int F3(String s, [int i = -1]);
//                              ^
// [analyzer] SYNTACTIC_ERROR.DEFAULT_VALUE_IN_FUNCTION_TYPE
// [cfe] Can't have a default value in a function type.
typedef F4(String s, {int i = -1});
//                          ^
// [analyzer] SYNTACTIC_ERROR.DEFAULT_VALUE_IN_FUNCTION_TYPE
// [cfe] Can't have a default value in a function type.

main() {
}
