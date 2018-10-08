/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion There is no requirement that the expression e evaluate to a
 * special kind of exception or error object.
 * @description Checks that values of various types can be thrown.
 * @author kaigorodov
 * @reviewer rodionov
 */
import "../../../Utils/expect.dart";

main() {
  var v1 = -1;
  try {
    throw v1;
  } catch (e) {
    Expect.equals(v1, e);
  }

  var v2 = {"1": 1, "2": 2, "3": 3, "4": 4};
  try {
    throw v2;
  } catch (e) {
    Expect.equals(v2, e);
  }

  var v3 = () => null;
  try {
    throw v3;
  } catch (e) {
    Expect.equals(v3, e);
  }
}
