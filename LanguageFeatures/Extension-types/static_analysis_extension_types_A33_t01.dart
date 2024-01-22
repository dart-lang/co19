// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An extension type V is always-exhaustive if and only if its
/// instantiated representation type is always-exhaustive.
///
/// @description Check that an extension type is always-exhaustive if its
/// representation type is always-exhaustive.
/// @author sgrekhov22@gmail.com

// SharedOptions=--enable-experiment=inline-class

import '../../Utils/expect.dart';

extension type BoolET(bool b) {}

String test(BoolET b) {
  switch (b) {
    case BoolET(b: true):
      return "True";
    case BoolET(b: false):
      return "False";
  }
}

main() {
  Expect.equals("True", test(BoolET(true)));
  Expect.equals("False", test(BoolET(false)));
}
