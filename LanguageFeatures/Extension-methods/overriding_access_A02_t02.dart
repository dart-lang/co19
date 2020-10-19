/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the extension does not declare a
 * member with the provided name.
 * @description Check that compile time error is thrown if the extension called
 * with the prefix does not declare a member with the given name
 * @author iarkh@unipro.ru
 */


import "extension_conflict_resolution_lib.dart" as testlib;

main() {
  bool res = testlib.MySimpleExt("testme").isLibraryVersion;
  int i = testlib.MySimpleExt("testme").getANum();
  testlib.MySimpleExt("testme").test();

  bool res1 = testlib.MySimpleExt("testme").isInt;
  //                                        ^^^^^
  // [analyzer] COMPILE_TIME_ERROR.UNDEFINED_EXTENSION_GETTER
  // [cfe] Getter not found: 'isInt'.
  var res2 = testlib.MySimpleExt("testme").getTest();
  //                                       ^^^^^^^
  // [analyzer] COMPILE_TIME_ERROR.UNDEFINED_EXTENSION_METHOD
  // [cfe] Method not found: 'getTest'.
  testlib.MySimpleExt("testme").put(11);
  //                            ^^^
  // [analyzer] COMPILE_TIME_ERROR.UNDEFINED_EXTENSION_METHOD
  // [cfe] Method not found: 'put'.
}
