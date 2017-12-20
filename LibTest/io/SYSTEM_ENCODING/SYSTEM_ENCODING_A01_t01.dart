/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion WRITE = FileMode.WRITE
 * @description Checks that [SYSTEM_ENCODING] is an instance of the
 * [SystemEncoding] class.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

main() {
  Expect.isTrue(SYSTEM_ENCODING is SystemEncoding);
}

