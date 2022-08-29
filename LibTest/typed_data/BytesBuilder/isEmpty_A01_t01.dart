// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion bool isEmpty
/// Returns true if the buffer is empty.
/// @description Checks that this property returns true if the buffer is empty
/// @author sgrekhov@unipro.ru

import "dart:typed_data";
import "../../../Utils/expect.dart";

main() {
  BytesBuilder builder = new BytesBuilder();
  Expect.isTrue(builder.isEmpty);

  var data = [1, 2, 3];
  builder.add(data);
  Expect.isFalse(builder.isEmpty);
}
