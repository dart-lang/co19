/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If the string is not already all upper case, returns a new string
 *            where all characters of this string are made upper case. Returns
 *            this otherwise.
 * @description Checks basic cases (latin alphabet)
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("LOWERCASE", "lowercase".toUpperCase());
  Expect.equals("ALMOSTLOWERCASE", "Almostlowercase".toUpperCase());
}
