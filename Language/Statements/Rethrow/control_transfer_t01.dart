/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Otherwise, control is transferred to the nearest innermost
 * enclosing exception handler.
 * @description Checks that control is transferred to the nearest innermost
 * enclosing exception handler. Checks that no change is made to the current
 * exception.
 * @author kaigorodov
 */
import '../../../Utils/expect.dart';

main() {
  var obj = "foo";
  var seen = null;
  try {
    try {
      try {
        throw obj;
      } on String catch (ok) {
        rethrow;
      }
    } on String catch (ok) {
      seen = ok;
    }
  } on String catch (ok) {
    Expect.fail("wrong handler");
  }
  Expect.identical(obj, seen);
}
