/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final int millisecondsSinceEpoch
 * The milliseconds since 1970-01-01T00:00:00Z (UTC).
 * This value is independent of the time zone.
 * @description Checks that millisecondsSinceEpoch if used as an argument of
 * fromMillisecondsSinceEpoch() constructor produces the same date
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  DateTime now = new DateTime.now();
  DateTime now2 = new DateTime.fromMillisecondsSinceEpoch(
      now.millisecondsSinceEpoch);
  Expect.equals(now.millisecondsSinceEpoch, now2.millisecondsSinceEpoch);
}
