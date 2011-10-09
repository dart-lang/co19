// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/** 
 * @assertion try constructs may have a finally clause. A finally clause is written after
 * any catch clauses. If a finally clause is present, then a try statement does not need
 * to have any catch clause.
 * @description Checks that if a finally clause is present,
 * then a try statement does not need to have any catch clause.
 * @author pagolubev
 * @reviewer iefremov
 */


void main() {
  try {}
  finally {}
}
