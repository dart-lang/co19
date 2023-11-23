// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion String toString()
/// Returns the string "null".
/// @description Checks that this method returns the correct value
/// @author rodionov

import "../../../Utils/expect.dart";

main() {
  Expect.equals("null", null.toString());
}
