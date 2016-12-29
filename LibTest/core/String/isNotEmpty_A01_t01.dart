/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isNotEmpty
 * Returns true if this string is not empty.
 * @description Checks that this property returns true if this string is not
 * empty.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isFalse("".isNotEmpty);
  Expect.isTrue(" ".isNotEmpty);
  Expect.isTrue("""
    """.isNotEmpty);
  Expect.isTrue("\u0000".isNotEmpty);
  Expect.isTrue("u0000".isNotEmpty);
}
