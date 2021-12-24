// Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion LinkedHashSet()
/// Creates an empty [Set].
/// @description Checks that an empty [LinkedHashSet] is created
/// @author msyabro

import "../../../Utils/expect.dart";
import "dart:collection";

main() {
  var set = new LinkedHashSet();
  Expect.isTrue(set is LinkedHashSet);
  Expect.runtimeIsType<LinkedHashSet>(set);
  Expect.isTrue(set.isEmpty);
}
