/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion ProcessInfo()
 *
 * @description Checks that constructor [ProcessInfo] creates a new object of
 * type ProcessInfo and two objects created with this constructor are different.
 * @author ngl@unipro.ru
 */
import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(new ProcessInfo() is ProcessInfo);
  Expect.isFalse(new ProcessInfo() == new ProcessInfo());
}
