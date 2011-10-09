/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion A function that accepts a variable number of arguments receives those arguments as an array.
 * @description Check that function recieves arguments as an array
 * @author msyabro 
 */


void func(...arguments) {
  Expect.isTrue(arguments is Array);
}

void main() {
  func(1);
  
  func(1, 2, 3);
}
