/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The static type of the logical-or expression is bool.
 * @description Check that type of the logical-or expression is bool
 * @author msyabro
 * @reviewer akuznecov
 * @needsreview 'is' vs static checker
 */
 

void main() {
  Expect.isTrue( (true || false) is bool);
}
