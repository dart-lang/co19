/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The current exception is the last unhandled exception thrown.
 * @description Checks the current exception is the last unhandled exception
 * thrown.
 * @author kaigorodov
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

main() {
  var last = "fail2";
  try {
    throw "fail1";
  } catch (e) {
    try {
      throw last;
    } catch (e) {
       Expect.equals(last, e);
   }
  }
}
