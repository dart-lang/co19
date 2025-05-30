// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is not an error if an extension type has an instance getter
/// named `g` with return type `R` and a setter named `g=` with parameter type
/// `S`, and `R` is not a subtype of `S`.
///
/// @description Checks that it is a not an error if an extension type
/// declares an instance setter with the same basename as the representation
/// variable but with a not compatible type
/// @author sgrekhov22@gmail.com
/// @issue 53489, 58579

import '../../Utils/expect.dart';

extension type ET(int id) {
  void set id(String i) {}
}

main() {
  ET et = ET(42);
  Expect.equals(42, et.id);
  et.id = "42";
  Expect.equals(42, et.id);
}
