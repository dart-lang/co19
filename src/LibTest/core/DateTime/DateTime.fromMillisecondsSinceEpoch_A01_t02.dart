/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion DateTime.fromMillisecondsSinceEpoch(int millisecondsSinceEpoch, {bool isUtc: false})
 * Constructs a new DateTime instance with the given millisecondsSinceEpoch.
 * If isUtc is false then the date is in the local time zone.
 * The constructed DateTime represents 1970-01-01T00:00:00Z + millisecondsSinceEpoch ms
 * in the given time zone (local or UTC).
 * @description Checks that If isUtc is false then the date is in the local time zone.
 * @author iefremov
 */
import "../../../Utils/expect.dart";


main() {
  DateTime d = new DateTime.fromMillisecondsSinceEpoch(1, isUtc: true);
  Expect.identical(d, d.toUtc());

  d = new DateTime.fromMillisecondsSinceEpoch(1, isUtc: false);
  Expect.identical(d, d.toLocal());

  d = new DateTime.fromMillisecondsSinceEpoch(1);
  Expect.identical(d, d.toLocal());
}
