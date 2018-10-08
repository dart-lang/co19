/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const systemEncoding = const SystemEncoding()
 * The current system encoding.
 *
 * This us used for converting from bytes to/from String when communicating on
 * stdin, stdout and stderr.
 *
 * On Windows this will use the currently active code page for the conversion.
 * On all other systems it will always use UTF-8.
 * @description Checks that [systemEncoding] is an instance of the
 * [SystemEncoding] class.
 * @author iarkh@unipro.ru
 */
import "../../../Utils/expect.dart";
import "dart:io";

main() {
  Expect.isTrue(systemEncoding is SystemEncoding);
}

