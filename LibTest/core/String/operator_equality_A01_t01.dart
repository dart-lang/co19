/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether the two strings are equal.
 * @description Checks that this operator works correctly
 * @author msyabro
 */
import "../../../Utils/expect.dart";


main() {
  String str1 = "String 1";
  String str2 = "String 2";
  String str3 = "String 1";
  
  Expect.isTrue(str1 == str3);
  Expect.isTrue(!(str1 == str2));
  
  Expect.isTrue(!(str1 == "String1"));
  
  Expect.isTrue(str1 == str1);
  
  Expect.isTrue('' == "");
  Expect.isTrue("\u0061\u0062" == "ab");
}
