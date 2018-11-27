/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool echoMode
 * On Windows this mode can only be enabled if [lineMode] is enabled as well.
 * @description Checks that either [echoMode] and [lineMode] both are [true] or
 * both are [false] on Windows.
 * read inside the dart process.
 * @author iarkh@unipro.ru
 * @Issue 31932
 */
import "../../../Utils/expect.dart";
import "dart:io";

main(List<String> args) {
  if(Platform.isWindows)
    Expect.equals(stdin.echoMode, stdin.lineMode);
}
