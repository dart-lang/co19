// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All imports and exports of the same URI in a Dart program denotes
/// the same library, and imports or exports of different URIs denote distinct
/// libraries.
///
/// @description Checks that imports of the same URI in a Dart program denotes
/// the same library.
/// @author sgrekhov22@gmail.com

import '../../../../Utils/expect.dart';
import 'same_uri_common_lib.dart' as l1;
import '../Semantics_of_Imports/same_uri_common_lib.dart' as l2;

main() {
  Expect.equals(0, l1.increment);
  Expect.equals(1, l1.counter);
  Expect.equals(1, l2.increment);
  Expect.equals(2, l2.counter);
}
