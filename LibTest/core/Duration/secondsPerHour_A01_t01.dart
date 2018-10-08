/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Holds the number of seconds in an hour.
 * @description Checks that the value of this property is correct.
 * @author rodionov
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(3600, Duration.secondsPerHour);
}
