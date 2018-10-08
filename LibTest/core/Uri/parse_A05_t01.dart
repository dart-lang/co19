/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Uri parse(String uri, [int start = 0, int end])
 * Creates a new Uri object by parsing a URI string.
 * ...
 * If the string is not valid as a URI or URI reference, a FormatException is
 * thrown.
 * @description Checks that if the string is not valid as a URI or URI
 * reference, a FormatException is thrown.
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {Uri.parse("###");}, (e) => e is FormatException);
  Expect.throws(() {Uri.parse("::::");}, (e) => e is FormatException);
}
