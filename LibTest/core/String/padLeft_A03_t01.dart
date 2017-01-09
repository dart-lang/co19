/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String padLeft(int width, [String padding = ' '])
 * ...
 * A negative width is treated as zero.
 * @description Checks that a negative width is treated as zero.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("dart", "dart".padLeft(-4));
  Expect.equals("dart", "dart".padLeft(-3));
  Expect.equals("dart", "dart".padLeft(-2));
  Expect.equals("dart", "dart".padLeft(-1));
  Expect.equals("dart", "dart".padLeft(-10));
  Expect.equals("dart", "dart".padLeft(-4, "-"));
  Expect.equals("dart", "dart".padLeft(-3, "-"));
  Expect.equals("dart", "dart".padLeft(-2, "-"));
  Expect.equals("dart", "dart".padLeft(-1, "-"));
  Expect.equals("dart", "dart".padLeft(-10, "-"));
}
