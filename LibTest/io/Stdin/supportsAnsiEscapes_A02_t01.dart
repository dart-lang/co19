/*
 * Copyright (c) 2018, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool supportsAnsiEscapes
 * Currently, a [TERM] environment variable containing the string [xterm] will
 * be taken as evidence that ANSI escape sequences are supported.
 * @description Checks that [supportsAnsiEscapes] is set [true] if [TERM]
 * environment variable is [xterm].
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

main(List<String> args) {
  if(Platform.environment.containsKey("TERM") &&
      Platform.environment["TERM"] == "xterm")
    Expect.isTrue(stdin.supportsAnsiEscapes);
  else
    Expect.isFalse(stdin.supportsAnsiEscapes);
}
