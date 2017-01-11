/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String padLeft(int width, [String padding = ' '])
 * ...
 * If padding has length different from 1, the result will not have length width.
 * This may be useful for cases where the padding is a longer string
 * representing a single character, like "&nbsp;" or "\u{10002}". In that case,
 * the user should make sure that this.length is the correct measure of the
 * strings length.
 * @description Checks that If padding has length different from 1, the result
 * will have expected length
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("12121212dart", "dart".padLeft(8, "12"));
  Expect.equals("---dart", "dart".padLeft(5, "---"));
}
