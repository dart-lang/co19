/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates a new list of the given length.
 * @description Tries to pass argument of a wrong type.
 * @author vasya
 * @reviewer iefremov
 * @dynamic-type-error
 * @needsreview
 */

main() {
  List a = new List("10");
}
