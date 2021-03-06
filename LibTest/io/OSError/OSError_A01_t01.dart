// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion const OSError([String message = "", int errorCode = noErrorCode])
/// Creates an OSError object from a message and an errorCode.
///
/// @description Checks that OSError object is created correctly when constructor
/// is run with default parameters.
/// @author ngl@unipro.ru

import "dart:io";
import "../../../Utils/expect.dart";

main() {
  OSError error = new OSError();
  Expect.equals(OSError.noErrorCode, error.errorCode);
  Expect.equals("", error.message);
}
