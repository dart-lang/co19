/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Documentation comments are comments that begin with the tokens ///
 * or '/''*''*'.
 * @description Checks that the nesting of documentation comments is allowed and
 * there doesn't need to be whitespace between adjacent start/end tokens.
 * @author rodionov
 * @reviewer iefremov
 */

import "../../../../Utils/expect.dart";

/**
  Main comment
  /**
    Sub comment
  */
  End of main comments
  /** /* /** Deeply nested comment **/**/**/
  /***//***/
*/

main() {
  Expect.equals(true, true);
}
