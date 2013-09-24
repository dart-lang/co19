/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a top-level getter invocation i of the form m, where m is an
 * identifier, proceeds as follows:
 * The getter function m is invoked. The value of i is the result returned by
 * the call to the getter function.
 * The static type of i is the declared return type of m.
 * @description Checks that the static type of a top-level getter invocation expression
 * is the declared return type of the getter.
 * @static-clean
 * @author msyabro
 * @reviewer rodionov
 */

int get a {}

bool get b {}

String get c {}

main()  {
  int resInt = a;
  bool resBool = b;
  String resString = c;
}
