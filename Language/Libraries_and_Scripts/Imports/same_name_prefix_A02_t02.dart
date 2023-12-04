// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the prefix used in a deferred
/// import is also used as the prefix of another import clause
///
/// @description Checks that it is not an error if two deferred libraries with
/// two different prefixes are imported
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';
import 'static_type_lib.dart' deferred as p1;
import 'syntax_lib.dart' deferred as p2;

main() async {
  asyncStart();
  await p1.loadLibrary();
  await p2.loadLibrary();
  Expect.equals(1, p1.someFunc()); // from static_type_lib.dart
  Expect.equals("hide", p2.hide); // from syntax_lib.dart
  asyncEnd();
}
