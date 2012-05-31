/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a run time error if library does not declare or import a top level function main().
 * @description Checks that it is a run time error if a script has top level function main
 * with incorrect signature.
 * @runtime-error
 * @author vasya
 * @reviewer msyabro
 * @needsreview issue 3271
 */

//error - main must not have arguments.
main(x) {
  print(x);
}


