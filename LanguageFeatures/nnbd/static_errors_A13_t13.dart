/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is an error to call the default List constructor with a length
 * argument and a type argument which is potentially non-nullable.
 *
 * @description Check that it is not an error if the default List constructor is
 * called with no length argument but with a type argument which is potentially
 * non-nullable.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-strong
import "dart:async";
import "legacy_lib.dart";

main() {
  new List<LegacyFoo>();
  new List<A>();
  new List<FutureOr<LegacyFoo>>();
  new List<FutureOr<A>>();
  new List<FutureOr<FutureOr<A>>>();
}
