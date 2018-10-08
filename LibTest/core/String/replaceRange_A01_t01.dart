/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String replaceRange(int start, int end, String replacement)
 * Replaces the substring from start to end with replacement.
 * @description Checks that this method replaces the substring from start to end
 * with replacement
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("abc3456", "123456".replaceRange(0, 2, "abc"));
  Expect.equals("1abc3456", "123456".replaceRange(1, 2, "abc"));
  Expect.equals("12345abc", "123456".replaceRange(5, 6, "abc"));
  Expect.equals("123456abc", "123456".replaceRange(6, 6, "abc"));
  Expect.equals("abc123456", "123456".replaceRange(0, 0, "abc"));
  Expect.equals("12abc3456", "123456".replaceRange(2, 2, "abc"));
}
