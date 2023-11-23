// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion It is an error for a class with a generative const constructor to
/// have a late final instance variable.
///
/// @description Check that it is not an error for a class with a factory const
/// constructor to have a late final field.
/// @author sgrekhov@unipro.ru

import "../../Utils/expect.dart";

class C {
  late final int i = 42;

  C() {}
  const factory C.f() = D;
}

class D implements C {
  final i = 1;
  const D();
}

main()  {
  const c = C.f();
  Expect.equals(1, c.i);
}
