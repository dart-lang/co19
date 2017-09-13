/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool listSupported
 * Whether list is supported.
 * list is currently unsupported on Android.
 *
 * @description Checks that false is returned on Android and true on other
 * platforms.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  if (!Platform.isAndroid) {
    Expect.isTrue(NetworkInterface.listSupported);
  } else {
    Expect.isFalse(NetworkInterface.listSupported);
  }
}
