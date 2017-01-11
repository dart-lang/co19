/*
 * Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isNotEmpty
 * Returns whether the buffer is not empty. This is a constant-time operation.
 * @description Checks that this method returns true if the buffer is not empty
 * and false otherwise
 * @author sgrekhov@unipro.ru
 */
import "../../../Utils/expect.dart";

main() {
  StringBuffer sb = new StringBuffer();
  Expect.isFalse(sb.isNotEmpty);
  Expect.isFalse((sb..write("")).isNotEmpty);
  Expect.isTrue((sb..write(null)).isNotEmpty);
  Expect.isFalse((sb..clear()).isNotEmpty);
  Expect.isTrue((sb..write("abc")).isNotEmpty);
}
