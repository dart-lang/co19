/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion String host
 * If there is no host associated with the address this returns the numeric
 * address.
 * @description Checks that if there is no host associated with the given
 * address [host] returns the numeric address.
 * @author iarkh@unipro.ru
 */

import "../../../Utils/expect.dart";
import "dart:io";

main() {
  dynamic address = new InternetAddress("999:13:14:771");
  Expect.equals("999:13:14:771", address.host);
}
