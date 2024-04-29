// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension type `V` is a proper subtype of `Object?`. It is
/// potentially non-nullable, unless it implements `Object` or a subtype thereof
///
/// @description Checks that an extension type is assignable to a type `T?` when
/// `T` is its representation type
/// @author sgrekhov22@gmail.com

import "../../Utils/expect.dart";

extension type ET(int _) implements int {}

main() {
  int? et = null;
  if (2 > 1) {
    et = ET(1);
  }
  int x = et is int ? et : 2;
  Expect.equals(1, x);
}
