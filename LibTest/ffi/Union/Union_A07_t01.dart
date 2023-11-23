// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Union cannot be implemented or used as a mixin
///
/// @description Checks that it is a compile error if Union is implemented
/// @author sgrekhov@unipro.ru
/// @issue 44935

import "dart:ffi";

class U1 implements Union {
//                  ^^^^^
// [analyzer] unspecified
// [cfe] unspecified
}

void main() {
  U1? u1;
}
