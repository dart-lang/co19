/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String operator *(int times)
 * Creates a new string by concatenating this string with itself a number of
 * times.
 * The result of str * n is equivalent to str + str + ...(n times)... + str.
 * @description Checks that this operator creates a new string by concatenating
 * this string with itself a number of times.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals("ssss", "s" * 4);
  Expect.equals("\\s\\s\\s\\s", "\\s" * 4);
  Expect.equals(r"\s\s\s\s", r"\s" * 4);
}
