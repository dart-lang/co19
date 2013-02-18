/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion First, the expression b is evaluated to an object o.
 *  Then, o is subjected to boolean conversion, producing an object r.
 * @description Checks that it an AssertionError (see 11.4.1 Boolean conversion)
 * is thrown in checked mode if the expression evaluates to null.
 * @author kaigorodov
 * @reviewer rodionov
 */
import "../../Utils/expect.dart";
import "../../Utils/dynamic_check.dart";

main() {
  var i = null;
  bool err = false;
  try {
    if (i) {i = "hello";}
  } on AssertionError catch (e) {
    err = true;
  }
  Expect.isTrue(err == isCheckedMode(), "AssertionError expected ONLY in checked mode");
}
