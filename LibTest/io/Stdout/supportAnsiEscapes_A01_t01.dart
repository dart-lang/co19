/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool supportsAnsiEscapes
 * Read-only
 * @description Checks that [supportAnsiEscapes] is a read-only property.
 * @author iarkh@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  dynamic out = stdout;
  Expect.throws(() { out.supportsAnsiEscapes = true; },
      (e) => e is NoSuchMethodError);
  out = stderr;
  Expect.throws(() { out.supportsAnsiEscapes = true; },
      (e) => e is NoSuchMethodError);
}
