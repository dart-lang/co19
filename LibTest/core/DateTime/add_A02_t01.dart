/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion DateTime add(Duration duration)
 * Returns a new DateTime with the duration added to this.
 * @description Checks that an exception is thrown if the argument is null.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview undocumented
 */
import "../../../Utils/expect.dart";

 main() {
   try {
     new DateTime(2000, 1, 1, 0, 0, 0, 0).add(null);
     Expect.fail("Error is expected");
   } on Error catch(e) {}
 }
