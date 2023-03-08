// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Given a switch statement which switches over an expression e of
/// type T, where the cases are dispatched based on expressions e0...ek:
///
/// - It is no longer required that the ei evaluate to instances of the same
///  class.
/// - It is an error if any of the ei evaluate to a value whose static type is
///  not a subtype of T.
/// - It is an error if any of the ei evaluate to constants for which equality
///  is not primitive.
/// - If T is an enum type, it is a warning if the switch does not handle all
///  enum cases, either explicitly or via a default.
/// - If T is Q? where Q is an enum type, it is a warning if the switch does not
///  handle all enum cases and null, either explicitly or via a default.
///
/// @description Check that it is a warning if T is Q? where Q is an enum type
/// and the switch does not handle all enum cases and null, either explicitly or
/// via a default.
/// @author sgrekhov@unipro.ru

// @dart=2.19
// Requirements=nnbd-weak

enum E {
  one,
  two,
  three
}

main() {
  E? e = E.three;
  switch (e) {
//^^^^^^^^^^
// [analyzer] STATIC_WARNING.MISSING_ENUM_CONSTANT_IN_SWITCH
    case E.one:
      true;
      break;
    case E.two:
      false;
      break;
  }
}
