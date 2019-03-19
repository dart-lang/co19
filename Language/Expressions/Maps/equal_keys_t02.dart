/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if two keys of a constant map literal
 * are equal according to their ‘==’ operator
 * @description Check that it is no compile-time error if two keys of not
 * constant map literal are equal according to their ‘==’ operator
 * @issue #36258
 * @author sgrekhov@unipro.ru
 */
import '../../../Utils/expect.dart';

class C {
  int a;
  int b;

  C(this.a, this.b);

  int get hashCode => a;
  bool operator== (Object other) => other is C && this.a == other.a;
}

main() {
  var m1 = <int, String>{1: "val1", 1: "val2"};
  Expect.mapEquals({1: "val2"}, m1);
  var m2 = <String, int>{"key1": 1, "key1": 2};
  Expect.mapEquals({"key1": 2}, m2);
  var m3 = <C, int>{new C(1, 2): 1, new C(1, 3): 2};
  Expect.mapEquals({new C(1, 3): 2}, m3);
  var m4 = <C, int>{new C(1, 2): 1, new C(1, 3): 2};
  Expect.mapEquals({new C(1, 3): 2}, m4);
}
