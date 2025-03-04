// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion We say that a type T is nullable if Null <: T and not T <: Object.
/// This is equivalent to the syntactic criterion that T is any of:
///  Null
///  S? for some S
///  S* for some S where S is nullable
///  FutureOr<S> for some S where S is nullable
///  dynamic
///  void
///
/// @description Check that null can be assigned to nullable type. Test void
/// @author sgrekhov@unipro.ru

void test() {}

main() {
  var v = test();
  v = null;

  void x = null;
}
