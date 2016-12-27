/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion interface String extends Comparable, Pattern
 * @description Checks that String really implements Pattern and Comparable
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  String s = new String.fromCharCodes([0x61, 0x62, 0x63]);
  
  Expect.isTrue(s is Comparable);
  Expect.isTrue(s is Pattern);
}
