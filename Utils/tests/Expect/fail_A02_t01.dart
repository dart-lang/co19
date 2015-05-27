/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void fail(String msg)
 * Descriptive error message is provided. 
 * @description Checks that message of thrown ExpectException is set to the msg argument.
 * @author varlax
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

main() {
  check(null);
  check("");
  check("sdjgksjdg");
}

void check(String msg) {
  try {
    Expect.fail(msg);
    throw new Exception("ExpectException expected");
  } on ExpectException catch(e) {
    if (!e.message.contains(msg.toString(), 0)) throw "ExpectException message: '${e.message}'"
      " doesn't contain the argument of fail() ( ${ msg.toString()} )";
  }
}
