/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a switch statement of the form
 * switch (e) {
 *   label11 … label1j1 case e1: s1
 * …
 *   labeln1 ..labelnjn case en: sn
 *   label(n+1)1 ..label(n+1)jn default: sn+1
 * }
 * or the form
 * switch (e) {
 *   label11 … label1j1 case e1: s1
 * …
 *   labeln1 ..labelnjn case en: sn
 * }
 * proceeds as follows:
 * The statement var id = e; is evaluated, where id is a variable whose name is
 * distinct from any other variable in the program.  In checked mode, it is a
 * run time error if the value of e is not an instance of the same type as the
 * constants e1 … en.
 * Next, the case clause case e1: s1 is executed if it exists. If case e1: s1
 * does not exist, then if there is a default clause it is executed by
 * executing sn+1.
 * @description Checks that if a switch statement does not have any case
 * clauses, the default clause is executed.
 * @author msyabro
 * @reviewer rodionov
 */
import '../../../Utils/expect.dart';

foo(p) {
  switch (p) {
    default: return 1;
  }
}

main() {
  Expect.equals(1, foo(1));
  Expect.equals(1, foo(null));
  Expect.equals(1, foo(''));
}
