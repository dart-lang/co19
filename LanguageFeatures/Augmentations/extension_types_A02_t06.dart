// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An augmentation can add a body to an extension type's implicit
/// constructor, which isn't otherwise possible. This is done by augmenting the
/// constructor in the body of the extension type.
///
/// @description Checks that an augmentation of an extension type's implicit
/// constructor may have an initializer list.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=macros

import '../../Utils/expect.dart';
part 'extension_types_A02_t06_lib.dart';

extension type ET(int id) {}

main() {
  Expect.equals(1, ET(1).id);
  if (assertStatementsEnabled) {
    Expect.throws(() {
      ET(-1);
    });
  }
}
