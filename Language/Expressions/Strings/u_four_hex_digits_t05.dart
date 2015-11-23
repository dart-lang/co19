/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error when a non-raw string literal contains
 * a character sequence of the form \u that is not followed by either a
 * sequence of four hexadecimal digits, or by curly brace delimited sequence of
 * hexadecimal digits.
 * @description Checks that a string with the \u sequence followed by more than
 * 4 hexadecimal digit characters is interpreted correctly.
 * @author rodionov
 * @reviewer kaigorodov
 */
import '../../../Utils/expect.dart';

main() {
  Expect.stringEquals("\u004F1F", "O1F");
}
