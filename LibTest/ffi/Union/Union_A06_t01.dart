// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Union subclasses cannot be empty
///
/// @description Checks that it is a compile error if Union subclass is empty
/// @author sgrekhov@unipro.ru
/// @issue 44935
/// @issue 46199

// SharedOptions=--enable-experiment=class-modifiers

import "dart:ffi";

final class U1 extends Union {
//          ^^
// [analyzer] unspecified
// [cfe] unspecified
}

void main() {
  U1? u1;
}
