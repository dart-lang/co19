/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion DateTime subtract(Duration other)
 * Throws [Error] if [other] is [:null:].
 * @description Checks that correct exception is thrown.
 * @author msyabro
 * @reviewer pagolubev
 * @needsreview undocumented
 */
import "../../../Utils/expect.dart";

 main() {
   try {
     new DateTime(2000, 1, 1).subtract(null);
     Expect.fail("Error is expected");
   } on Error catch(e) {}
   try {
     new DateTime(2000, 1, 2).subtract(1);
     Expect.fail("Error is expected");
   } on Error catch(e) {}
 }
