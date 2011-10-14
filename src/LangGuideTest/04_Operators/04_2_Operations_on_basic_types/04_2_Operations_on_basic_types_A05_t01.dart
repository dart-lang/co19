/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion All arithmetic operations return precise numbers if the operands are precise. 
 * If both arguments of an arithmetic operation are integers and result yields integer, 
 * then the result will be a integer
 * @description Check the type of result of arithmetical operations on integers
 * @author akuznecov
 */


main() {
  Expect.isTrue((8 / 4) is double);
  Expect.isTrue((6 / 4) is double);  
}
