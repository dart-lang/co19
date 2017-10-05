/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const SystemEncoding()
 *
 * @description Checks that SystemEncoding() creates SystemEncoding instance
 * @author a.semenov@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  const SystemEncoding systemEncoding = const SystemEncoding();
  Expect.isNotNull(systemEncoding);
  Expect.isTrue(systemEncoding is SystemEncoding);
}
