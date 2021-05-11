// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Cookie(String name, String value)
/// Creates a new cookie optionally setting the name and value.
/// By default the value of httpOnly will be set to true.
/// @description Checks that it is a compile error if name is null
/// @issue 29463
/// @author sgrekhov@unipro.ru

import "dart:io";

main() {
  new Cookie(null, "some value");
//           ^^^^
// [analyzer] unspecified
// [cfe] unspecified
}
