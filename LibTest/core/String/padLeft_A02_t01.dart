/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String padLeft(int width, [String padding = ' '])
 * ...
 * If width is already smaller than or equal to this.length, no padding is
 * added.
 * @description Checks that if width is already smaller than or equal to
 * this.length, no padding is added.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("dart", "dart".padLeft(4));
  Expect.equals("dart", "dart".padLeft(3));
  Expect.equals("dart", "dart".padLeft(2));
  Expect.equals("dart", "dart".padLeft(1));
  Expect.equals("dart", "dart".padLeft(0));
  Expect.equals("dart", "dart".padLeft(4, "-"));
  Expect.equals("dart", "dart".padLeft(3, "-"));
  Expect.equals("dart", "dart".padLeft(2, "-"));
  Expect.equals("dart", "dart".padLeft(1, "-"));
  Expect.equals("dart", "dart".padLeft(0, "-"));
}
