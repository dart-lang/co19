// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Struct subclasses cannot be empty
///
/// @description Checks that it is a compile error if Struct subclass is empty
/// @author sgrekhov@unipro.ru
/// @issue 44935

// SharedOptions=--enable-experiment=class-modifiers

import "dart:ffi";

final class S1 extends Struct {
//          ^^
// [analyzer] unspecified
// [cfe] unspecified
}

void main() {
  S1? s1;
}
