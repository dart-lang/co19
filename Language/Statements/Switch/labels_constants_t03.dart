/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Given a switch statement of the form
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
 * it is a compile-time error if the expressions ek are not compile-time
 * constants for all k = 1..n.
 * @description Checks that it is not a compile-time error if a case expression
 * is null.
 * @author msyabro
 * @reviewer rodionov
 */

main() {
  try {
    switch (null) {
      case null:
    }
  } catch (e) {}
}
