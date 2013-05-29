/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion abstract E lastWhere(bool test(E value), {E orElse()})
 * By default, when orElse is null, a StateError is thrown.
 * @description Checks that If none matches and orElse is null, a StateError is thrown.
 * function is returned.
 * @author kaigorodov
 */
import "../../../Utils/expect.dart";

var noneMatches=new Object();

void check(List a, var element) {
  bool failed=false;
  try {
    a.lastWhere((var value)=>value==element);
    faled=true;
  } on StateError catch(ok) {}
  Expect.isFalse(failed); 
}

main() {
  List a = [42, 0, -1, 42, -1, 6031769, 0];
  check(a, 43);
  check(a, 2);
  check(a, -2);
  check(a, 6031768);
}
