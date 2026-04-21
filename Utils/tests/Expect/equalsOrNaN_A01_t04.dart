// Copyright (c) 2026, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion static void equalsOrNaN(var expected, var actual, [String reason = ''])
/// Checks whether the expected and actual values are equal (using `==`).
///
/// @description NaNs considered equals
/// @author sgrekhov22@gmail.com

import "../../../Utils/expect.dart";

main() {
   Expect.throws((){
      Expect.equalsOrNaN(double.nan, "string");
   }, null, "string");
   Expect.throws((){
      Expect.equalsOrNaN(double.nan, null);
   }, null, "null");
   Expect.throws((){
      Expect.equalsOrNaN(double.nan, 0);
   }, null, "zero");
   Expect.throws((){
      Expect.equalsOrNaN(double.nan, double.infinity);
   }, null, "Infinity");
   Expect.equalsOrNaN(double.nan, double.nan);
   Expect.equalsOrNaN(0.0/0.0, 0.0/0.0);
   Expect.equalsOrNaN(double.nan, 0.0/0.0);
}
