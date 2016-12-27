/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a new string where leading and trailing whitespaces of
 *            this string have been removed, or returns this string if it does
 *            not have leading and trailing whitespaces.
 * @note whitespace is defined in spec chapter 13.1.2
 * @description Checks that all kinds of whitespace characters are removed by
 * this method
 * @author msyabro
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(" ".trim() == "");
  Expect.isTrue(" _ ".trim() == "_");
  Expect.isTrue(" _ _ ".trim() == "_ _");

  Expect.equals("", " ".trim());
  Expect.equals("", "\n".trim());
  Expect.equals("", "\r".trim());
}
