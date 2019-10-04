/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Finally, the conditional [?]/[:] operator only evaluates one of
 * its branches, depending on whether the condition expression evaluates to
 * [true] or [false]. The other branch must also be a potentially constant
 * expression.
 * @description Checks that conditional operator [?]/[:] works correctly if all
 * the operands are correct potentially constant expressions.
 * @author iarkh@unipro.ru
 */
import "../../Utils/expect.dart";

const ok_str = "OK";
const wrong_str = "wrong";

class MyClass1 {
  final String res;
  const MyClass1(String str) : res = (true ? str : "false");
}

class MyClass2 {
  final String res;
  const MyClass2(String str) : res = (true ? "OK" : str);
}

class MyClass3 {
  final String res;
  const MyClass3(String str) : res = (false ? str : "false");
}

class MyClass4 {
  final String res;
  const MyClass4(String str) : res = (false ? wrong_str : str);
}


main() {
  const MyClass1 c1 = MyClass1("true");
  Expect.equals("true", c1.res);

  const MyClass1 c2 = MyClass1(ok_str);
  Expect.equals("OK", c2.res);

  const MyClass2 c3 = MyClass2("true");
  Expect.equals("OK", c3.res);

  const MyClass2 c4 = MyClass2(ok_str);
  Expect.equals("OK", c4.res);

  const MyClass3 c5 = MyClass3("false");
  Expect.equals("false", c5.res);

  const MyClass3 c6 = MyClass3(ok_str);
  Expect.equals("false", c6.res);

  const MyClass4 c7 = MyClass4("true");
  Expect.equals("true", c7.res);

  const MyClass4 c8 = MyClass4(ok_str);
  Expect.equals("OK", c8.res);

}
