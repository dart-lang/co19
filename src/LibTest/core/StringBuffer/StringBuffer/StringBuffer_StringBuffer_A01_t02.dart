/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates the string buffer with an initial content.
 * @description Try to pass null to constructor
 * @author msyabro
 * @needsreview undocumented
 */


main() {
  StringBuffer sb = new StringBuffer(null);
  Expect.isTrue(sb.toString() == "null");
}
