/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Writes specified code point [codePoint].
 * @description Try to pass another type as [codePoint]
 * @author msyabro
 * @needsreview Can't check what result should be because
 * method is unimplemented
 * @static-type-error
 */


main() {
  StringBuffer sb = new StringBuffer();
  sb.writeCodePoint("string");
}
