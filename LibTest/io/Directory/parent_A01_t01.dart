// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Directory parent
/// The directory containing this.
/// @description Checks that this property returns the directory containing this.
/// Test relative path
/// @author sgrekhov@unipro.ru
/// @issue 29692

import "dart:io";
import "../../../Utils/expect.dart";

main() {
  Directory dir = new Directory("NotExisting");
  Expect.equals(".", dir.parent.path);
}
