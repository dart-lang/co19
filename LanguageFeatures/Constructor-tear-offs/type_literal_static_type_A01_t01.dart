// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The static type of the instantiated type literal is Type
///
/// @description Check that the static type of the instantiated type literal is
/// Type
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

main() {
  var intList = List<int>;
  Expect.isTrue(intList is Type);
  Expect.isFalse(intList is List<String>); // to check that intList is not dynamic
  Expect.runtimeIsNotType<List<String>>(intList);
}
