/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion WRITE_ONLY = FileMode.WRITE_ONLY
 * @description Checks that [WRITE_ONLY] is set to [FileMode.WRITE_ONLY].
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

main() {
  Expect.equals(FileMode.WRITE_ONLY, WRITE_ONLY);
}

