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

const meta = 1;

String log = "";

extension type ET1(int id) {}

augment extension type ET1 {
  augment void set id(int v) {
    log = "$v";
  }
}

extension type ET2(int id) {}

augment extension type ET2 {
  @meta
  augment void set id(int v) {
    log = "$v";
  }
}

main() {
  var et1 = ET1(1);
  et1.id = 2;
  Expect.equals(1, et1.id);
  Expect.equals("2", log);

  var et2 = ET2(2);
  et2.id = 3;
  Expect.equals(2, et2.id);
  Expect.equals("3", log);
}
