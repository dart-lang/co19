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
import 'same_uri_lib3.dart' deferred as l3;
import 'same_uri_lib4.dart' deferred as l4;

main() async {
  await l3.loadLibrary();
  Expect.equals(0, l3.lib3Increment);
  Expect.equals(1, l3.lib3Counter);
  await l4.loadLibrary();
  Expect.equals(1, l4.lib4Increment);
  Expect.equals(2, l4.lib4Counter);
}
