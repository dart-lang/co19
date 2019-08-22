/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion We say that a type T is nullable if Null <: T and not T <: Object.
 * This is equivalent to the syntactic criterion that T is any of:
 *  Null
 *  S? for some S
 *  S* for some S where S is nullable
 *  FutureOr<S> for some S where S is nullable
 *  dynamic
 *  void
 *
 * @description Check that null can be assigned to nullable type. Test S* for
 * some S where S is nullable. Test pre-NNBD legacy classes
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
import "legacy_library_lib.dart";

main() {
  A? a = new A();
  a = null;

  C? c = null;
  c = new C<A>(a);
  c = null;
}
