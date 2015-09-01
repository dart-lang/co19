/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Execution of a finally clause finally s of a try statement proceeds as follows:
 *  The statement s is executed. Then, if the current exception is defined,
 *  control is transferred to the nearest dynamically enclosing exception handler.
 * @description Explicitly checks that if no matching catch clause was found for the current
 * exception, control is transferred to the nearest dynamically enclosing exception handler.
 * @author rodionov
 * @reviewer iefremov
 */
import '../../../Utils/expect.dart';


void main() {
  bool flag1 = false, flag2 = false;
  
  try {
    try {
      do {
        try {
          for(int i = 0; i < 10; i++) {
            try {
              throw new Exception("fail");
            } on int catch(e) {
            } finally {}
          }
        } on String catch(s) {}
      } while(false);
    } finally {
      flag1 = true;
    }
  } catch(ok) {
    flag2 = true;
  }

  Expect.isTrue(flag1);
  Expect.isTrue(flag2);
}
