/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void writeAll(Iterable objects, [String separator = ""])
 * Passing null as argument results in an Error
 * @description Tries to pass null as argument
 * @author msyabro
 * @reviewer rodionov
 * @needsreview undocumented
 */
import "../../../Utils/expect.dart";


main() {
  try {
    new StringBuffer().addAll(null);
    Expect.fail("Error is expected");
  } on Error catch(e) {}
}
