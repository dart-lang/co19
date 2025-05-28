// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error if a class has a setter and a getter with the same
/// basename where the return type of the getter is not a subtype of the argument
/// type of the setter. Note that this error specifically requires subtyping and
/// not assignability and hence makes no exception for dynamic.
///
/// @description Check that it is not an error if a class has a setter and a
/// getter with the same basename where the return type of the getter is not a
/// subtype of the argument type of the setter.
/// @author sgrekhov@unipro.ru
/// @issue 40333
/// @issue 40945

import '../../Utils/expect.dart';

class C {
  void set test(int v) {}
  dynamic get test => 3.14;
}

main() {
  C c = C();
  c.test = 1;
  Expect.equals(3.14, c.test);
}
