/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Writes [length] bytes into the output stream from
 * the specified array [buffer] starting at specified [offset].
 * @description Try to pass array of different type as [buffer]
 * @author msyabro
 * @static-type-error
 * @needsreview method unimplemented
 */


main() {
  StringBuffer sb = new StringBuffer();
  sb.writeByteArray(["1", "2", "3", "4"], 0, 4);
}
