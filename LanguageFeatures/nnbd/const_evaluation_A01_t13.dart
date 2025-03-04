// Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion With sound null safety, all generic const constructors and
/// generic const literals are evaluated using the actual type arguments
/// provided, whether legacy or non-legacy. This ensures that with sound null
/// safety, the final consistent semantics are obeyed.
///
/// @description Checks dynamically that actual generic class type parameter is
/// evaluated correctly for [Object] type argument.
/// @author iarkh@unipro.ru

import "../../Utils/expect.dart";

class A<T> {
  const A();
  void testme() { Expect.equals(Object, T); }
}

main() {
  const a = A<Object>();
  a.testme();
}
