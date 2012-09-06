/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a compile-time error if the name of a named
 * optional parameter begins with an _ character.
 * @description Checks that it is a compile-time error if the name of a positional
 * optional parameter begins with an '_' character.
 * @compile-error
 * @author msyabro
 * @reviewer kaigorodov
 * @reviewer iefremov
 * @reviewer rodionov
 */

main() {
  try {
    void func([var _x]) {}
    func(1);
  } catch(x) {}
}
