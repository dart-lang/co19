/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns a new string where leading and trailing whitespaces of
 *            this string have been removed, or returns this string if it does
 *            not have leading and trailing whitespaces.
 * @description Checks that if the string does not have leading or trailing
 *              whitespaces, then it is returned instead of a new string.
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  String str = "string";
  Expect.identical(str, str.trim());
}
