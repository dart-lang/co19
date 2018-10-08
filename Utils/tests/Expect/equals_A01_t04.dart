/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion static void equals(var expected, var actual, [String reason = null])
 * Checks whether the expected and actual values are equal (using [:==:]).
 * @description NaNs considered equals
 * @author varlax
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

main() {
   Expect.throws((){
      Expect.equals(double.nan, "string");
   }, null, "string");
   Expect.throws((){
      Expect.equals(double.nan, null);
   }, null, "null");
   Expect.throws((){
      Expect.equals(double.nan, 0);
   }, null, "zero");
   Expect.throws((){
      Expect.equals(double.nan, double.infinity);
   }, null, "Infinity");
   Expect.equals(double.nan, double.nan);
   Expect.equals(0.0/0.0, 0.0/0.0);
   Expect.equals(double.nan, 0.0/0.0);
}
