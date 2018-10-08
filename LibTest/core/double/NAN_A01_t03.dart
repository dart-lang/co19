/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double NAN
 * @description Checks that NAN can't be equal, lt or gt 0
 * @author hlodvig
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isFalse((double.nan > 0));
  Expect.isFalse((double.nan < 0));
  Expect.isFalse((double.nan >= 0));
  Expect.isFalse((double.nan <= 0));
  Expect.isFalse((double.nan == 0));
}
