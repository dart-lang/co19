// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An assignment of the form super[e1] = e2 is equivalent to the
/// expression super.[e1] = e2
/// @description Checks that it is a compile error if no []= operator was found
/// in the superclass
/// @author sgrekhov@unipro.ru


import '../../../Utils/expect.dart';

class A {
  operator [](idx) {}

  noSuchMethod(Invocation im) {
    Expect.equals(const Symbol("[]="), im.memberName,
        "Incorrect method was searched: ${im.memberName}");
  }
}

class C extends A {
  test() {
    Expect.equals(1, super[1] = 1);
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
    Expect.equals(2, super[false] = 2);
//                        ^
// [analyzer] unspecified
// [cfe] unspecified
    Expect.equals("12", super["foo"] = "1" "2");
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
    Expect.equals(true, super[-1.11] = 1 < 2);
//                           ^
// [analyzer] unspecified
// [cfe] unspecified
  }
}

main() {
  C c = new C();
  c.test();
}
