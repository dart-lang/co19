/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Writes specified byte [value] to the output stream.
 * @description Try to pass negative number as [value]
 * @author msyabro
 * @needsreview Can't check what result should be because
 * method is unimplemented
 */


main() {
  StringBuffer sb = new StringBuffer();
  sb.writeByte(-1);
}
