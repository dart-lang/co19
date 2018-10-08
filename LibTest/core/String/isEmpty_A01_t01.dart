/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether this string is empty.
 * @description Checks that this property works correctly
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue("".isEmpty);
  Expect.isFalse(" ".isEmpty);
  Expect.isFalse("""
    """.isEmpty);
  Expect.isFalse("\u0000".isEmpty);
  Expect.isFalse("u0000".isEmpty);
}
