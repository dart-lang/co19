/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String padLeft(int width, [String padding = ' '])
 * Pads this string on the left if it is shorter than width.
 *
 * Return a new string that prepends padding onto this string one time for each
 * position the length is less than width.
 * @description Checks that this method returns a new string that prepends
 * padding onto this string one time for each position the length is less than
 * width.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("dart", "dart".padLeft(4));
  Expect.equals(" dart", "dart".padLeft(5));
  Expect.equals("  dart", "dart".padLeft(6));
  Expect.equals("   dart", "dart".padLeft(7));
  Expect.equals("dart", "dart".padLeft(4, "-"));
  Expect.equals("-dart", "dart".padLeft(5, "-"));
  Expect.equals("--dart", "dart".padLeft(6, "-"));
  Expect.equals("___dart", "dart".padLeft(7, "_"));
}
