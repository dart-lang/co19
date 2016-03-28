/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a run time error if S does not declare or export either:
 * • A top-level function named main, or
 * • A top-level getter named main that returns a function.
 * @description Checks that it is not a run time error if S exports a top level
 * function main().
 * @author vasya
 * @reviewer msyabro
 */

import "library4.dart";
export "library4.dart";

