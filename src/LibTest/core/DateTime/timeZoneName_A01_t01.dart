/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final String timeZoneName
 * Returns the abbreviated time-zone name.
 * @description Checks that the method returns strings.
 * @author iefremov
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(new DateTime.now().timeZoneName is String);
  Expect.isTrue(new DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).timeZoneName is String);
  Expect.isTrue(new DateTime.fromMillisecondsSinceEpoch(0, isUtc: false).timeZoneName is String);
}

