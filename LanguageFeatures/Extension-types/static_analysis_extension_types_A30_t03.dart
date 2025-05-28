// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is not an error if an extension type has an instance getter
/// named `g` with return type `R` and a setter named `g=` with parameter type
/// `S`, and `R` is not a subtype of `S`.
///
/// @description Checks that it is not an error error if an extension type
/// declares a static setter with the same basename as the static getter but
/// with an incompatible type
/// @author sgrekhov22@gmail.com
/// @issue 53489

import '../../Utils/expect.dart';

extension type ET(int id) {
  static void set x(String i) {}
  static int get x => 42;
}

main() {
  Expect.equals(42, ET.x);
  ET.x = "42";
  Expect.equals(42, ET.x);
}
