// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion values constant Null safety
/// List<Abi> const values
/// The ABIs that the DartVM can run on.
///
/// Does not contain a macosIA32. We have stopped supporting 32-bit MacOS.
///
/// Includes windowsArm64, even though it is currently not supported. Support
/// has been requested for Flutter.
/// https://github.com/flutter/flutter/issues/53120
///
/// @description Checks that this list contains `windowsArm64` and the current
/// ABI
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "../../../Utils/expect.dart";

main() {
  Expect.isTrue(Abi.values.contains(Abi.current()));
  Expect.isTrue(Abi.values.contains(Abi.windowsArm64));
}