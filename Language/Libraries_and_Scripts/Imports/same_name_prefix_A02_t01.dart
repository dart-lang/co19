// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is a compile-time error if the prefix used in a deferred
/// import is also used as the prefix of another import clause
///
/// @description Checks that it is not an error if the prefix used in a
/// non-deferred import is also used as the prefix of another immediate import
/// clause
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';
import 'static_type_lib.dart' as p;
import 'syntax_lib.dart' as p;

main() {
  Expect.equals(1, p.someFunc()); // from static_type_lib.dart
  Expect.equals("hide", p.hide); // from syntax_lib.dart
}
