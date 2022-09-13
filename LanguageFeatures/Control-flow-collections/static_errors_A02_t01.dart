// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a static error when the collection is a map and the key type
/// of any of the body elements may not be assigned to the map's key type.
///
/// @description Checks that it is a static error when the collection is a map
/// and the key type of any of the body elements may not be assigned to the map's
/// key type.
/// @author sgrekhov@unipro.ru


main() {
  <int, int>{if (true) "not int": 1};
//                     ^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.MAP_KEY_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'String' can't be assigned to a variable of type 'int'.
  Map<int, int> m1 = {if (true) "not int": 1};
//                              ^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.MAP_KEY_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'String' can't be assigned to a variable of type 'int'.
  const <int, int>{if (true) "not int": 1};
//                           ^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.MAP_KEY_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'String' can't be assigned to a variable of type 'int'.
  <int, int>{for (var i in []) "not int": 1};
//                             ^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.MAP_KEY_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'String' can't be assigned to a variable of type 'int'.
  Map<int, int> m2 = {for (var i in []) "not int": 1};
//                                      ^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.MAP_KEY_TYPE_NOT_ASSIGNABLE
// [cfe] A value of type 'String' can't be assigned to a variable of type 'int'.
}
