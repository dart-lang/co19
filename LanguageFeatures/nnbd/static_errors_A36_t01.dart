// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is no longer a warning to override a method which has a
/// default value for a parameter with a method with a different default value
/// for the corresponding parameter.
///
/// @description Check that it is not a warning to override a method which has a
/// default value for a parameter with a method with a different default value
/// for the corresponding parameter.
/// @author sgrekhov22@gmail.com

import '../../Utils/expect.dart';

class A {
  int foo([int x = 1]) => x;
  int bar({int x = 1}) => x;
}

class C extends A {
  int foo([int x = 2]) => x;
  int bar({int x = 2}) => x;
}

main() {
  Expect.equals(2, C().foo());
  Expect.equals(2, C().bar());
}
