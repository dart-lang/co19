/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Returns true if every elements of the collection satisfy the
 * predicate [f]. Returns false otherwise.
 * @description Tries to pass non-function object as argument [f]
 * @static-warning
 * @author msyabro
 * @reviewer varlax
 */


#import("../../../Utils/dynamic_check.dart");

check(f()) {
  try {
    f();
    if(isCheckedMode()) {
      Expect.fail("TypeError is expected");
    } else {
      Expect.fail("ObjectNotClosureException is expected");
    }
  } on TypeError catch(e) {
    if(!isCheckedMode()) {
      Expect.fail("Type error in scripting mode");
    }
  } on ObjectNotClosureException catch(e) {
    if(isCheckedMode()) {
      Expect.fail("ObjectNotClosureException in checked mode");
    }
  }
}

main() {
  Queue list = new Queue();
  
  //empty queue just ignores invalid arg
  int x = 0;
  list.every(null);

  checkTypeError( () {
    list.every(x);
  });

  list.addLast(1);
  
  try {
    list.every(null);
    Expect.fail("ObjectNotClosureException is expected");
  } on ObjectNotClosureException catch(e){}

  check( () {
    list.every(x);
  });
}
