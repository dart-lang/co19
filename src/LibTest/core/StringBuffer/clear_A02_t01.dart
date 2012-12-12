/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns [this]
 * @description Checks that this method returns the same object
 * @reviewer pagolubev
 * @author rodionov
 */


main() {
  StringBuffer sb = new StringBuffer();
  Expect.identical(sb, sb.clear());

  sb = new StringBuffer("");
  Expect.identical(sb, sb.clear());

  sb = new StringBuffer("aaa");
  Expect.identical(sb, sb.clear());
}
