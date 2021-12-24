// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion toString() → String
/// Returns a description of the format exception.
/// @description Checks that [toString] causes no error and the result is not
/// null and is indeed a [String].
/// @author rodionov

import "../../../Utils/expect.dart";
 
main() {
  FormatException e = new FormatException();
  Expect.isTrue(e.toString().isNotEmpty);
  Expect.isTrue(e.toString() is String);
  Expect.runtimeIsType<String>(e.toString());

  FormatException s = new FormatException("FormatException");
  Expect.isTrue(s.toString().isNotEmpty);
  Expect.isTrue(s.toString() is String);
  Expect.runtimeIsType<String>(e.toString());
}
