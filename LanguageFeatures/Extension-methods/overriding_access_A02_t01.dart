// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the extension does not declare a
/// member with the provided name.
/// @description Check that compile time error is thrown if the extension does
/// not declare a member with the given name
/// @author iarkh@unipro.ru



extension MySimpleExt on String {
  bool get test => false;
  int getANum() => 12345;
  void tryme() {}
}

main() {
  bool res = MySimpleExt("testme").test;
  int i = MySimpleExt("testme").getANum();
  MySimpleExt("testme").tryme();

  bool res1 = MySimpleExt("testme").test1;
//                                  ^^^^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_EXTENSION_GETTER
// [cfe] Member not found: 'test1'.
  dynamic res2 = MySimpleExt("testme").getAString;
//                                     ^^^^^^^^^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_EXTENSION_GETTER
// [cfe] Member not found: 'getAString'.
  MySimpleExt("testme").put(11);
//                      ^^^
// [analyzer] COMPILE_TIME_ERROR.UNDEFINED_EXTENSION_METHOD
// [cfe] Method not found: 'put'.
}
