/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Writes specified string [str] to the output stream.
 * @description Try to pass null as [str]
 * @author msyabro
 */


main() {
  StringBuffer sb = new StringBuffer();
  sb.writeString(null);
  Expect.isTrue(sb.toString() == "");
}
