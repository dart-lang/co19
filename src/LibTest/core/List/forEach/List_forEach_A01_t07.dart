/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Applies the function [f] for each element of the list.
 * @description Argument function [f] is not applicable to the elements of the list.
 * @author vasya
 * @dynamic-type-error
 * @reiviewer msyabro
 */

main() {
  [1,2,3].forEach(void f(String e) { return "null"; } );
}
