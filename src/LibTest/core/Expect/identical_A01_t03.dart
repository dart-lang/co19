/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void identical(var expected, var actual, [String reason = null]) 
 * Checks whether the expected and actual values are identical.
 * @description Checks that equality operator is not used.
 * @author varlax
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

class A {
  operator ==(var b) {
    return true;
  }
}


main() {
  try {
    Expect.identical(new A(), new A());
    throw "ExpectException expected";
  } on ExpectException catch(ok) {
  }
}
