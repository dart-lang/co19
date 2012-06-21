/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Given a switch statement of the form
 * switch (e) { label11 … label1j1 case e1: s1 … labeln1 ..labelnjn case en: sn default: sn+1}
 * or the form switch (e) { label11 … label1j1 case e1: s1 … labeln1 ..labelnjn case en: sn},
 * it is a compile-time error if the expressions ek are not compile-time constants,
 * of type int or String, for all 1 <= k <= n.
 * @description Checks that it is a compile-time error if a case expression
 * is a compile-time constant of type double.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

main() {
  try {
    switch(1) {
      case 0.5:
    }
  } catch(var e) {}
}
