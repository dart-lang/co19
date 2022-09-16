// Copyright (c) 2021, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Constructor tear-off feature also contain a fix for the following
///
/// test(Object o) {
///   var isInt = o is int;
///   if (isInt) {
///     o.isEven; // ERROR: `isEven` not defined for type `Object`
///   }
/// }
/// See https://github.com/dart-lang/language/issues/1785
///
/// @description Checks that flow analysis works if the boolean variable has an
/// implicit type
/// @author sgrekhov@unipro.ru

test1(Object o) {
  var isInt = o is int;
  if (isInt) {
    o.isEven;
  }
}

test2(Object o) {
  var isInt;
  isInt = o is int;
  if (isInt) {
    o.isEven;
  }
}

test3(Object o) {
  dynamic isInt = o is int;
  if (isInt) {
    o.isEven;
  }
}

main() {
  test1(42);
  test2(42);
  test3(42);
}
