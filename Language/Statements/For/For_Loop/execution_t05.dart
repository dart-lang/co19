/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a for statement of the form for (var v = e0; c; e) s
 * proceeds as follows:
 * If c is empty then let c' be true otherwise let c' be c.
 * First the variable declaration statement var v = e0 is executed. Then:
 * 1. If this is the first iteration of the for loop, let v' be v. Otherwise,
 *    let v' be the variable v'' created in the previous execution of step 4.
 * 2. The expression [v'/v]c is evaluated and subjected to boolean conversion.
 *    If the result is false, the for loop completes. Otherwise, execution
 *    continues at step 3.
 * 3. The statement [v'/v]s is executed.
 * 4. Let v'' be a fresh variable. v'' is bound to the value of v'.
 * 5. The expression [v''/v]e is evaluated, and the process recurses at step 1.
 * @description Checks that if expression [v'/v]c is evaluated and the result is
 * true, the execution continues at step 3.
 * @author vasya
 * @reviewer rodionov
 * @reviewer iefremov
 */
import '../../../../Utils/expect.dart';

main() {
  String log = "";
  for (var i = 0; i < 1; i++) {
    log =  "${log}ok";
  }
  Expect.equals("ok", log);
}

