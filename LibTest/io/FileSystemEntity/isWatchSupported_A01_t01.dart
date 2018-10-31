/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isWatchSupported
 * Test if watch is supported on the current system.
 *
 * OS X 10.6 and below is not supported.
 * @description Checks that this property returns true if watch is supported on
 * the current system.
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  if (!Platform.isMacOS) {
    Expect.isTrue(FileSystemEntity.isWatchSupported);
  }
}
