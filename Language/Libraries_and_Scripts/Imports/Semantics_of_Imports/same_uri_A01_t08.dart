// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion All imports and exports of the same URI in a Dart program denotes
/// the same library, and imports or exports of different URIs denote distinct
/// libraries.
///
/// @description Checks that imports of the same URI in a Dart program denotes
/// the same library. Test deferred imports of the same URI.
/// @author sgrekhov22@gmail.com

import '../../../../Utils/expect.dart';
import 'same_uri_lib5.dart' deferred as l5;
import 'same_uri_lib6.dart' deferred as l6;

main() async {
  await l5.loadLibrary();
  await l5.lib5Load();
  Expect.equals(0, l5.lib5Increment);
  Expect.equals(1, l5.lib5Counter);
  await l6.loadLibrary();
  await l6.lib6Load();
  Expect.equals(1, l6.lib6Increment);
  Expect.equals(2, l6.lib6Counter);
}
