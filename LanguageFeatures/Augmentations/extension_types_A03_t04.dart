// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The extension also introduces a complete getter for the
/// representation variable.
///
/// @description Checks that it is not an error if an augmentations adds a
/// setter with the same basename as the representation variable.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=augmentations

import '../../Utils/expect.dart';

String log = "";

extension type ET(int id) {}

augment extension type ET {
  augment void set id(int v) {
    log = "$v";
  }
}

main() {
  var et = ET(1);
  et.id = 2;
  Expect.equals(1, et.id);
  Expect.equals("2", log);
}
