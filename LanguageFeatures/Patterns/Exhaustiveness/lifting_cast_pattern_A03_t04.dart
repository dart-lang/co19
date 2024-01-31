// Copyright (c) 2024, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion The lifted space union for a pattern with matched value type M is
/// ...
/// Cast pattern:
/// ...
/// Let S be the lifted space union of the cast's subpattern in context C.
/// i. If C is a subset (see below about type subsetting) of S then the result
///   spaces is the lifted space union of M.
/// ii. Otherwise, the result spaces is S plus the lifted space union of Null
///   when C is a non-nullable type, and spaces is S when C is potentially
///   nullable.
///
/// @description Check a lifted space of a cast pattern in case of a type
/// `dynamic`
/// @author sgrekhov22@gmail.com

import '../../../Utils/expect.dart';

Object test1(dynamic d) {
  // Assume that d is either `bool` or `String`.
  switch (d) {
    case final bool _:
      return "bool";
    case final __ as String:
      return "String";
  }
}

String test2(dynamic d) => switch (d) {
      final bool _ => "bool",
      final __ as String => "String",
    };

main() {
  Expect.equals("bool", test1(true));
  Expect.equals("String", test1(""));
  Expect.equals("bool", test2(true));
  Expect.equals("String", test2(""));
}
