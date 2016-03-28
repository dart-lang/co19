/*
 * Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a run time error if S does not declare or export either:
 * • A top-level function named main, or
 * • A top-level getter named main that returns a function.
 * @description Checks that it is not a runtime error if S declares a top-level
 * getter named main, returning function.
 * @author ngl@unipro.ru
 */
import "../../../Utils/expect.dart";

var x = 1;
get main => () { Expect.equals(1, x); };
