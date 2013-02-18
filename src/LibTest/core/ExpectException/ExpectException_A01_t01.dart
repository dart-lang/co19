/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Constructs a new exception with the specified message.
 * @description Checks that this constructor executes without error for various String arguments (including null).
 * @author rodionov
 * @reviewer varlax
 */
import "../../../Utils/expect.dart";
 
main() {
  Expect.isNull(new ExpectException(null).message);
  new ExpectException("");
  new ExpectException("asdgfsdjkg");
}
