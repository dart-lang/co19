/*
 * Copyright (c) 2019, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion To handle these gracefully, we support a [...?] "null-aware
 * spread" operator. In cases where the spread expression evaluates to [null],
 * that expands to an empty collection instead of throwing a runtime expression.
 *
 *  That turns the example to:
 *
 *   var command = [
 *   engineDartPath,
 *   '--target=flutter',
 *   ...?extraFrontEndOptions,
 *   mainPath
 *   ];
 * @description Checks that exception is thrown if spreadable element in the
 * [List] is not null-aware and it's [null].
 * @author iarkh@unipro.ru
 */

import "../../Utils/expect.dart";

List getAList(
    String engineDartPath, List extraFrontEndOptions, String mainPath) {
  return(
      [engineDartPath, "--target=flutter", ...extraFrontEndOptions, mainPath]);
}

main() {
  List a;

  Expect.listEquals(
      ["enginePath", "--target=flutter", "--option1", "--option2", "mainPath"],
      getAList("enginePath", ["--option1", "--option2"], "mainPath"));

  Expect.throws(() => a = getAList("enginePath", null, "mainPath"));
}
