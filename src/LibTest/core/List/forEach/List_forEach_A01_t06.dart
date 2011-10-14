/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Applies the function [f] for each element of the list.
 * @description Argument function [f] returns String.
 * @author vasya
 * @needsreview
 * @reviewer msyabro
 */

main() {
  [1,2,3].forEach(String f(int e) { return "null"; } );
}
