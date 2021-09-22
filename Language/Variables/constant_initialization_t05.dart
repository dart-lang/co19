// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion A constant variable must be initialized to a compile-time 
/// constant or a compile-time error occurs.
/// @description Checks that constant variables can be initialized by
/// `String.length`.
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

const int l = "string".length;

main() {
  const CheckIdentical(6, l);
  const CheckIdentical("string".length, l);
}
