/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future<T> last
 * read-only
 * @description Checks that [last] is read only
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

main() {
  dynamic sin = stdin;
  Expect.throws(() { sin.last = "12345"; }, (e) => e is NoSuchMethodError);
}
