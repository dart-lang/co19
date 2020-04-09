/*
 * Copyright (c) 2020, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Given a switch statement which switches over an expression e of
 * type T, where the cases are dispatched based on expressions e0...ek:
 *
 * - It is no longer required that the ei evaluate to instances of the same
 *  class.
 * - It is an error if any of the ei evaluate to a value whose static type is
 *  not a subtype of T.
 * - It is an error if any of the ei evaluate to constants for which equality
 *  is not primitive.
 * - If T is an enum type, it is a warning if the switch does not handle all
 *  enum cases, either explicitly or via a default.
 * - If T is Q? where Q is an enum type, it is a warning if the switch does not
 *  handle all enum cases and null, either explicitly or via a default.
 *
 * @description Check that it is no warning if a switch over a legacy type does
 * not handle null either explicitly or via a default.
 * @author sgrekhov@unipro.ru
 */
// SharedOptions=--enable-experiment=non-nullable
// Requirements=nnbd-weak
import "legacy_lib.dart";

main() {
  switch (iLegacy) {
    case 1:
      true;
      break;
    case 2:
      false;
      break;
    case 42:
      42;
  }
}
