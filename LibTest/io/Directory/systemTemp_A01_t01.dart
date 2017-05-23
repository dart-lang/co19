/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Directory systemTemp
 * Gets the system temp directory.
 *
 * Gets the directory provided by the operating system for creating temporary
 * files and directories in. The location of the system temp directory is
 * platform-dependent, and may be set by an environment variable.
 * @description Checks that this property returns the system temp directory
 * @author sgrekhov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Expect.isNotNull(Directory.systemTemp);
  Expect.isTrue(Directory.systemTemp is Directory);
}
