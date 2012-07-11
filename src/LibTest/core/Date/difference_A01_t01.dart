/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Duration difference(Date other) returns a [Duration] with the difference of [:this:] and [other]
 * @description Checks that the method returns Duration instance
 * @author hlodvig
 * @reviewer msyabro
 */

main() {
  Expect.isTrue(new Date.now().difference(new Date.now()) is Duration);
  Expect.isTrue(new Date.fromMillisecondsSinceEpoch(0).difference(new Date.fromMillisecondsSinceEpoch(1000)) is Duration);
  Expect.isTrue(new Date.fromMillisecondsSinceEpoch(0).difference(new Date.fromMillisecondsSinceEpoch(-1000)) is Duration);
  Expect.isTrue(new Date.fromMillisecondsSinceEpoch(1000).difference(new Date.fromMillisecondsSinceEpoch(0)) is Duration);
  Expect.isTrue(new Date.fromMillisecondsSinceEpoch(1000).difference(new Date.fromMillisecondsSinceEpoch(0)) is Duration);
  Expect.isTrue(new Date.fromMillisecondsSinceEpoch(0).difference(new Date.fromMillisecondsSinceEpoch(1000)) is Duration);
}
