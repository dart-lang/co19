/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion int exitCode
 * Default value is [0].
 * @description Checks that default exit code is [0].
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

main(List<String> args) {
  Expect.equals(0, exitCode);
}
