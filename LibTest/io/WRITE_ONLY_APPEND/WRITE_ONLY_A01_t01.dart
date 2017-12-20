/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion WRITE_ONLY_APPEND = FileMode.WRITE_ONLY_APPEND
 * @description Checks that [WRITE_ONLY_APPENS] is set to
 * [FileMode.WRITE_ONLY_APPEND].
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

main() {
  Expect.equals(FileMode.WRITE_ONLY_APPEND, WRITE_ONLY_APPEND);
}

