/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the string is not already all lower case, returns a new string
 *            where all characters of this string are made lower case. Returns
 *            this otherwise.
 * @description Checks that if the string is already in lower case, it is
 *              returned instead of a new string.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  String str = "all characters in lower case";
  String str2 = str.toLowerCase();

  Expect.identical(str, str2);
}
