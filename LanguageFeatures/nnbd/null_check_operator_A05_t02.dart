// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An expression of the form e! evaluates e to a value v, throws a
/// runtime error if v is null, and otherwise evaluates to v.
///
/// @description Check that an expression of the form e! evaluates e to a value
/// v, throws no runtime error if v is not null. Test 42
/// @author sgrekhov@unipro.ru
/// @issue 39723

import "../../Utils/expect.dart";

extension on int {
  String call(int i) => "Lily was here $i times";
  Object? operator [](int index) => index;
  void set s(int value) {}
  void operator []=(int index, int val) {}
}

main() {
  Expect.equals("Lily was here 2 times", 42!(2));
//                                         ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
  Expect.equals(24, 42![24]);
//                    ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
  42![24] = 24;
//  ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
  42!.s = 24;
//  ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
}
