/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String.fromCharCode(int charCode)
 * Allocates a new String for the specified charCode.
 * ...
 * @description Checks that a correct string is created
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  String str = new String.fromCharCode(0x61);
  Expect.equals("a", str);

  str = new String.fromCharCode(0);
  Expect.equals("\u0000", str);
  
  str = new String.fromCharCode(0x62);
  Expect.equals('b', str);
}
