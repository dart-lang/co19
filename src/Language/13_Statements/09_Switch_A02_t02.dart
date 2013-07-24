/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Given a switch statement of the form
 * switch (e) { label11 … label1j1 case e1: s1 … labeln1 ..labelnjn case en: sn default: sn+1}
 * or the form switch (e) { label11 … label1j1 case e1: s1 … labeln1 ..labelnjn case en: sn},
 * it is a compile-time error if the expressions ek are not compile-time constants for all
 * k = 1..n.
 * @description Checks that it is a compile-time error if case expressions
 * are of mixed types.
 * @compile-error
 * @author msyabro
 * @reviewer rodionov
 */

main() {
  var x=1;
  try {
    switch(x) {
      case 1:
        x=1;
      case 2.0:
        x=2;
    }
  } catch(e) {}
}
