/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Future done
 * read-only
 * @description Checks that [done] is read only
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

main() {
  dynamic sink = stdout;
  Expect.throws(() { sink.done = null; }, (e) => e is NoSuchMethodError);
  sink = stderr;
  Expect.throws(() { sink.done = null; }, (e) => e is NoSuchMethodError);
}
