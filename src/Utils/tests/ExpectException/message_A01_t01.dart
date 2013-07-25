/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Holds the error message of this exception.
 * @description Checks that this property holds the value passed as constructor's argument.
 * @author rodionov
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";
 
main() {
  check(null);
  check("");
  check("not empty");
}

void check(String arg) {
  ExpectException e = new ExpectException(arg);
  Expect.equals(arg, e.message);
}
