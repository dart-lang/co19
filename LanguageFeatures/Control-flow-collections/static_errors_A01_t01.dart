// Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a static error when the collection is a list and the type of
/// any of the body elements may not be assigned to the list's element type
///
/// @description Checks that it is a static error when the collection is a list
/// and the type of any of the body elements may not be assigned to the list's
/// element type
/// @author sgrekhov@unipro.ru


main() {
  <int>[if (true) "not int"];
//                ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  const <int>[if (true) "not int"];
//                      ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  List<int> l = [if (true) "not int"];
//                         ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  <int>[for (var i in []) "not int"];
//                        ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
  List<int> l1 = [for (var i in []) "not int"];
//                                  ^^^^^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
