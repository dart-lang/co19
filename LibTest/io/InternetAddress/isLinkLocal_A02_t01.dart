/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isLinkLocal
 * read-only
 * @description Checks that [isLinkLocal] is read-only
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

main() {
  dynamic address = new InternetAddress("192.168.16.23");
  Expect.throws(() {
    address.isLinkLocal  = true;
  }, (e) => e is NoSuchMethodError);
}
