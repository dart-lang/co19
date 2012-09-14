/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion double NEGATIVE_INFINITY
 * @description Checks NEGATIVE_INFINITY is not equal to NEGATIVE_INFINITY using equality operator
 * @author hlodvig
 * @needsreview
 */


main() {
  Expect.isFalse((double.NEGATIVE_INFINITY == double.NEGATIVE_INFINITY));
  Expect.isTrue((double.NEGATIVE_INFINITY != double.NEGATIVE_INFINITY));
}
