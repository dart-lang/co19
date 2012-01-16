/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion An interface has a set of direct superinterfaces. This set consists of the interfaces
 * specified in the extends clause of the interface.
 * superinterfaces:
 *   extends typeList
 * ;
 * @description Checks that the extends clause of an interface allows repetitions.
 * @author vasya
 * @reviewer rodionov
 * @reviewer kaigorodov
 */

interface J {}
interface K {}

interface I extends J, K, J, K {}

main() {}
