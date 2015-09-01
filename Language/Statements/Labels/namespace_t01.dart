/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The namespace of labels is distinct from the one used for types,
 * functions and variables.
 * @description Checks that it is not an error if there's a label that uses the
 * same identifier as a class, function or variable.
 * @author rodionov
 * @reviewer iefremov
 */

Label1() {}

class Label3 {}

main() {
  main: Label1();
  Label1: var x;
  Label2: var Label2;
  Label3: new Label3();
}
