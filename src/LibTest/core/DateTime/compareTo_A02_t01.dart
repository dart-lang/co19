/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int compareTo(DateTime other)
 * May throw an NoSuchMethodError if other is of a type that is not comparable to this.
 * @description Checks that the correct exception is thrown.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview undocumented
 */
import "../../../Utils/expect.dart";

main() {
  try {
    new DateTime(2000, 1, 1, 0, 0, 0, 0).compareTo(null);
    Expect.fail("Error is expected");
  } on NoSuchMethodError catch(e) {
  //print ("e=$e");
  }
  try {
    new DateTime(2000, 1, 1, 0, 0, 0, 0).compareTo(1);
    Expect.fail("Error is expected");
  } on NoSuchMethodError catch(e) {
  //print ("e=$e");
  }
}
