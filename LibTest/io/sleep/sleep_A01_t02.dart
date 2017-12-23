/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion void sleep(Duration duration)
 * Sleep for the duration specified in [duration].
 * @description Checks that exception is thrown if [duration] is negative.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

main(List<String> args) {
  Duration dur = new Duration (milliseconds: -3);
  Expect.throws(() { sleep(dur); }, (e) => e is ArgumentError);
}
