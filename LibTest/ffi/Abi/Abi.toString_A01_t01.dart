// Copyright (c) 2022, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion @override
/// String toString()
/// override
/// A string representation of this ABI.
///
// The string is equal to the 'on' part from Platform.version and dart --version
///
/// @description Checks that this method returns a string which is equal to the
/// 'on' part from Platform.version
/// @author sgrekhov@unipro.ru

import "dart:ffi";
import 'dart:io';
import "../../../Utils/expect.dart";

main() {
  final abi = Abi.current();
  String expected = Platform.version
      .substring(Platform.version.indexOf(" on ") + 4)
      .trim()
      .replaceAll("\"", "");
  Expect.equals(expected, abi.toString());
}
