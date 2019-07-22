/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the extension does not declare a
 * member with the provided name.
 * @description Check that compile time error is thrown if the extension does
 * not declare a member with the given name
 * @author iarkh@unipro.ru
 */
// SharedOptions=--enable-experiment=extension-methods

extension MySimpleExt on String {
  bool get test => false;
  int getANum() => 12345;
  void tryme() {}
}

main() {
  bool res = MySimpleExt("testme").test;
  int i = MySimpleExt("testme").getANum();
  MySimpleExt("testme").tryme();

  bool res1 = MySimpleExt("testme").test1;          //# 01: compile-time error
  dynamic res2 = MySimpleExt("testme").getAString;  //# 02: compile-time error
  MySimpleExt("testme").put(11);                    //# 03: compile-time error
}
