/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Throws ArgumentError if [index] is null
 * @description Tries to pass null as argument and expects an ArgumentError
 * @author msyabro
 * @reviewer rodionov
 * @needsreview undocumented
 */
import "../../../Utils/expect.dart";


main() {
  try {
    "string".charCodeAt(null);
    Expect.fail("ArgumentError is expected");
  } on ArgumentError catch(e) {}
}
