/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Duration difference(DateTime other) 
 * Returns a [Duration] with the difference of [:this:] and [other]
 * @description Checks that the method returns Duration instance
 * @author hlodvig
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(new DateTime.now().difference(new DateTime.now()) is Duration);
  Expect.isTrue(new DateTime.fromMillisecondsSinceEpoch(0).difference(new DateTime.fromMillisecondsSinceEpoch(1000)) is Duration);
  Expect.isTrue(new DateTime.fromMillisecondsSinceEpoch(0).difference(new DateTime.fromMillisecondsSinceEpoch(-1000)) is Duration);
  Expect.isTrue(new DateTime.fromMillisecondsSinceEpoch(1000).difference(new DateTime.fromMillisecondsSinceEpoch(0)) is Duration);
  Expect.isTrue(new DateTime.fromMillisecondsSinceEpoch(1000).difference(new DateTime.fromMillisecondsSinceEpoch(0)) is Duration);
  Expect.isTrue(new DateTime.fromMillisecondsSinceEpoch(0).difference(new DateTime.fromMillisecondsSinceEpoch(1000)) is Duration);
}
