// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All imports and exports of the same URI in a Dart program denotes
/// the same library, and imports or exports of different URIs denote distinct
/// libraries.
///
/// @description Checks that imports of the same URI in a Dart program denotes
/// the same library. Test imports of the same URI but different prefixes.
/// @author sgrekhov22@gmail.com

import '../../../../Utils/expect.dart';
import 'same_uri_lib3.dart';
import 'same_uri_lib4.dart';

main() {
  Expect.equals(0, lib3Increment);
  Expect.equals(1, lib3Counter);
  Expect.equals(1, lib4Increment);
  Expect.equals(2, lib4Counter);
}
