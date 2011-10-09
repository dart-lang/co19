/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns whether the two strings are equal, ignoring the case.
 * @description Try to pass null as argument
 * @author msyabro
 * @needsreview
 */


main() {
  Expect.isTrue(!"string".equalsIgnoreCase(null)); //Behavior is not documented
}
