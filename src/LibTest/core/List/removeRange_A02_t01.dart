/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion 
 * Throws an [UnsupportedError] if the list is not extendable.
 * @description Checks that an [UnsupportedError] is thrown as expected.
 * @author vasya
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";

main() {
  var a = new List(1);
  try {
    a.removeRange(0, 1);
    Expect.fail("UnsupportedError expected when calling List.removeRange()");
  } on UnsupportedError catch(ok) {}

  try {
    const[].removeRange(0, 1);
    Expect.fail("UnsupportedError expected when calling List.removeRange()");
  } on UnsupportedError catch(ok) {}
}
