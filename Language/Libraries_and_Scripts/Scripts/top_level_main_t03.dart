/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a run time error if S does not declare or export either:
 * • A top-level function named main, or
 * • A top-level getter named main that returns a function.
 * @description Checks that the top level function main can have 2 arguments,
 * as described in
 * https://api.dartlang.org/apidocs/channels/stable/dartdoc-viewer/dart-isolate.Isolate
 * Fixes in the lang spec pending (see dart bug #14530)
 * @author vasya
 * @reviewer msyabro
 */
import "../../../Utils/expect.dart";

main(x, y) {
  print("x=${x.runtimeType} $x");
  print("y=${y.runtimeType} $y");
}
