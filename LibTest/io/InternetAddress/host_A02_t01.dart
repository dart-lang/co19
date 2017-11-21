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
  dynamic address = new InternetAddress("193.13.14.71");
  Expect.equals("193.13.14.71", address.host);
}
