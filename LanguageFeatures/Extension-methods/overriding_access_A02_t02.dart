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
// SharedOptions=--enable-experiment=extension-methods

import "extension_conflict_resolution_lib.dart" as testlib;

main() {
  bool res = testlib.MySimpleExt("testme").isLibraryVersion;
  int i = testlib.MySimpleExt("testme").getANum();
  testlib.MySimpleExt("testme").test();

  bool res1 = testlib.MySimpleExt("testme").isInt;    //# 01: compile-time error
  var res2 = testlib.MySimpleExt("testme").getTest(); //# 02: compile-time error
  testlib.MySimpleExt("testme").put(11);              //# 03: compile-time error
}
