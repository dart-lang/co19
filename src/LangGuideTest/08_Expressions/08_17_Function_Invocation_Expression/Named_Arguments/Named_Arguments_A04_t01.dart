/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion It is a noSuchMethod situation to attempt to pass a named argument as both a positional argument and named argument.
 * @description Check that named argument can not be passed as a positional argument
 * @author msyabro
 * @needsreview previously in a02_t[12] theese checked without exceptions
 */


void func(int p, [int np]) {}

void main() {
  try {
    func(np:1);
  } catch(NoSuchMethodException e) {}
}
