/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String replaceFirstMapped(Pattern from,
 * String replace(Match match), [int startIndex = 0])
 *
 * @description Checks that if start is provided it must be in range
 * 0..string.length;
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {"123".replaceFirstMapped("1", (m) => "0", -1);});
  Expect.throws(() {"123".replaceFirstMapped("1", (m) => "0", 4);});
}
