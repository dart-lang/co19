/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion This method compares each individual scalar character codes of the
 * strings.
 * @description Checks that operator == is case sensitive
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  String str1 = "String";
  String str2 = "string";

  Expect.isTrue(!(str1 == str2));
}
