/*
 * Copyright (c) 2013, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion bool moveNext()
 * It is safe to invoke [moveNext] even when the iterator is
 * already positioned after the last element.
 * In this case moveNext has no effect.
 * @description Checks that it is sage to invoke [moveNext] when
 * the iterator is positioned after the last element.
 * @author msyabro
 */

main() {
  var it = new RuneIterator('');
  it.moveNext();
  it.moveNext();

  it = new RuneIterator('abc');
  it.rawIndex = 2;
  for(int i = 0; i < 10; ++i) {
    it.moveNext();
  }
}