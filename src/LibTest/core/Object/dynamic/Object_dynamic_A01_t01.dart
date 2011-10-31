/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Return this object without type information.  
 * @description Checks that this method indeed returns the instance it is invoked on.
 * @author rodionov
 * @reviewer pagolubev
 */
 
main() {
  Object o = new Object();
  Expect.isTrue(o === o.dynamic);
}
