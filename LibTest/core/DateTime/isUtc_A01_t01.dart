/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isUtc
 * True if this DateTime is set to UTC time.
 * @description check that returned value is correct
 * @author hlodvig
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isFalse(new DateTime(2012).isUtc);
  Expect.isTrue(new DateTime.utc(2012).isUtc);
  Expect.isFalse(new DateTime.fromMillisecondsSinceEpoch(1, isUtc: false).isUtc);
  Expect.isTrue(new DateTime.fromMillisecondsSinceEpoch(1, isUtc: true).isUtc);
}
