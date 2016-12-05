/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion interface Duration extends Comparable
 * @description Checks that a Duration instance really is Comparable
 * @author rodionov
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(
      new Duration(days: 1, hours: 1, minutes: 1, seconds: 1, milliseconds: 1)
      is Comparable);
}
