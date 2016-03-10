/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion The scope of a label that labels a statement s is s. The scope of
 * a label that labels a case clause of a switch statement s is s.
 * @description Checks that separate (not nested) statements may have labels
 * with the same name.
 * @author rodionov
 * @reviewer iefremov
 */

foo() {}

main() {
  Label: var x;
  Label: x = foo();
  Label: for (int i in [1,2]) {}
  Label: try {} catch (ok) {}
  Label: {}
}
