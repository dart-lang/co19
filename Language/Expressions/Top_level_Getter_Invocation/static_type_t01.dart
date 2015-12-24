/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Evaluation of a top-level getter invocation i of the form m,
 * where m is an identifier, proceeds as follows:
 * ...
 * The static type of i is the declared return type of m.
 * @description Checks that the static type of a top-level getter invocation
 * expression is the declared return type of the getter.
 * @static-clean
 * @author msyabro
 * @reviewer rodionov
 */

int get a => 1;

bool get b => true;

String get c => "";

main()  {
  int resInt = a;
  bool resBool = b;
  String resString = c;
}
