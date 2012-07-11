/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool isUtc() returns true if this [Date] is set to UTC time. 
 * @description check that returned value is correct
 * @author hlodvig
 * @reviewer msyabro
 */

main() {
  Expect.isFalse(new Date.fromMillisecondsSinceEpoch(1, false).isUtc());
  Expect.isTrue(new Date.fromMillisecondsSinceEpoch(1, true).isUtc());
}
