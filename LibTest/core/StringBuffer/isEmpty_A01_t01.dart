/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion final bool isEmpty
 * Returns whether the buffer is empty. This is a constant-time operation. 
 * @description Checks that this method returns true if the buffer is empty and
 * false otherwise
 * @author msyabro
 */
import "../../../Utils/expect.dart";

main() {
  StringBuffer sb = new StringBuffer();
  Expect.isTrue(sb.isEmpty);
  Expect.isTrue((sb..write("")).isEmpty);
  Expect.isFalse((sb..write(null)).isEmpty);
  Expect.isTrue((sb..clear()).isEmpty);
  Expect.isFalse((sb..write("abc")).isEmpty);
}
