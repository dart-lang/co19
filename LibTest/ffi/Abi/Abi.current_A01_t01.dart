// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Abi.current()
/// The ABI the Dart VM is currently running on.
///
/// @description Checks that this method returns the ABI the Dart VM is
/// currently running on
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import "../../../Utils/expect.dart";

main() {
  final abi = Abi.current();
  Expect.isTrue(Abi.values.contains(abi));
}