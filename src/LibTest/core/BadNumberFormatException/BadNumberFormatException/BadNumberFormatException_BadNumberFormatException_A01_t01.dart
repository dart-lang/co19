/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Undocumented
 * @description Checks that this constructor executes without error for various arguments (including null).
 * @author rodionov
 * @reviewer msyabro
 * @needsreview undocumented
 */
 
main() {
  new BadNumberFormatException(null);
  new BadNumberFormatException(true);
  new BadNumberFormatException(1);
  new BadNumberFormatException("asdgfsdjkg");
  new BadNumberFormatException([]);
  new BadNumberFormatException([null]);
  new BadNumberFormatException([1, true]);
}
