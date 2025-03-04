// Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion An expression of the form e! evaluates e to a value v, throws a
/// runtime error if v is null, and otherwise evaluates to v.
///
/// @description Check that an expression of the form e! evaluates e to a value
/// v, throws a runtime error if v is null. Test generic class with named
/// constructor
/// @author sgrekhov@unipro.ru
/// @issue 39723
/// @issue 39724
/// @issue 39758
/// @issue 41193

import "../../Utils/expect.dart";

class A<T> {
  String s = "Show must go on";
  foo() {}
  Object? get getValue => "Lily was here";
  Object? get getNull => null;
  int? operator [](int? index) => index;
  void operator []=(int index, String val) {
    s = val;
  }

  A.named(T? t) {
  }
}

main() {
  new A<String>.named("Let's have fun")!;
//                                     ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
  new A<String>.named("Let's have fun")!.foo();
//                                     ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
  new A<String>.named("Let's have fun")![42];
//                                     ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
  new A<String>.named("Let's have fun")!?.foo();
//                                     ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
//                                      ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  new A<String>.named("Let's have fun")!?[42];
//                                     ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
//                                      ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  new A<String>.named("Let's have fun").getValue!;
  new A<String>.named("Let's have fun")[42]!;
  new A<String>.named("Let's have fun")!.s = "Lily was here";
//                                     ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
  new A<String>.named("Let's have fun")!?.s = "Lily was here";
//                                     ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
//                                      ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  new A<String>.named("Let's have fun")![0] = "Lily was here";
//                                     ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
  new A<String>.named("Let's have fun")!?[0] = "Lily was here";
//                                     ^
// [analyzer] STATIC_WARNING.UNNECESSARY_NON_NULL_ASSERTION
//                                      ^^
// [analyzer] STATIC_WARNING.INVALID_NULL_AWARE_OPERATOR
  Expect.throws(() {new A<String>.named("Let's have fun").getNull!;});
  Expect.throws(() {new A<String>.named("Let's have fun")[null]!;});
}
