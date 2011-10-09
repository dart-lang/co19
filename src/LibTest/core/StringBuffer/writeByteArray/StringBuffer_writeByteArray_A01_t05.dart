/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Writes [length] bytes into the output stream from
 * the specified array [buffer] starting at specified [offset].
 * @description Try to pass array with incorrect values as [buffer]
 * @author msyabro
 * @needsreview method unimplemented. Divide into several tests
 * when method will be implemented
 */


main() {
  StringBuffer sb = new StringBuffer();
  sb.writeByteArray([-1, 1000], 0, 2);
}
