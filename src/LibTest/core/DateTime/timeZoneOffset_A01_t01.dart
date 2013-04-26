/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final Duration timeZoneOffset
 * The time-zone offset is the difference between local time and UTC.
 * That is, the offset is positive for time zones west of UTC.
 * @description Checks that the difference between utc and utc is zero and between utc and the local timezone
 * is a valid Duration object.
 * @author iefremov
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(0, new DateTime.fromMillisecondsSinceEpoch(100500, isUtc: true).timeZoneOffset.inMilliseconds);
  Expect.equals(0, new DateTime.fromMillisecondsSinceEpoch(100500, isUtc: true).timeZoneOffset.inMilliseconds);

  Expect.isTrue(new DateTime.fromMillisecondsSinceEpoch(100500, isUtc: false).timeZoneOffset.inMilliseconds >=0 ||
                new DateTime.fromMillisecondsSinceEpoch(100500, isUtc: false).timeZoneOffset.inMilliseconds < 0);
}

