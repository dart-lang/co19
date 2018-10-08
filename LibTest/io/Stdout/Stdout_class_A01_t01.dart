/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion CLASS Stdout
 * Stdout represents the IOSink for either stdout or stderr.
 * @description Checks that [stdin] and [stdout] are [IOSink] objects
 * @author iarkh@unipro.ru
 */

import "dart:io";
import "../../../Utils/expect.dart";

main() async {
  Expect.isTrue(stdout is IOSink);
  Expect.isTrue(stderr is IOSink);
}
