/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String replaceRange(int start, int end, String replacement)
 * ...
 * If end is null, it defaults to length.
 * @description Checks that if end is null, it defaults to length.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("abc", "123456".replaceRange(0, null, "abc"));
  Expect.equals("12abc", "123456".replaceRange(2, null, "abc"));
}
