/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String padRight(int width, [String padding = ' '])
 * Pads this string on the right if it is shorter than width.
 * Return a new string that appends padding after this string one time for each
 * position the length is less than width.
 * @description Checks that this method returns a new string that appends
 * padding onto this string one time for each position the length is less than
 * width.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("dart", "dart".padRight(4));
  Expect.equals("dart ", "dart".padRight(5));
  Expect.equals("dart  ", "dart".padRight(6));
  Expect.equals("dart   ", "dart".padRight(7));
  Expect.equals("dart", "dart".padRight(4, "-"));
  Expect.equals("dart-", "dart".padRight(5, "-"));
  Expect.equals("dart--", "dart".padRight(6, "-"));
  Expect.equals("dart___", "dart".padRight(7, "_"));
}
