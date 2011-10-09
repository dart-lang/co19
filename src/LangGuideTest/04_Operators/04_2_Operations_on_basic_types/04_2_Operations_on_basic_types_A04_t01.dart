/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The double comparison follows the IEEE double specification.
 * @description Test that -0.0 == 0.0 and NaN != NaN 
 * @author akuznecov
 * @reviewer msyabro
 */


void main() {
  Expect.isTrue(-0.0 == 0.0);
  Expect.isTrue(NaN != NaN);
}
