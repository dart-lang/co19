/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion If this collection is empty, returns true.
 * @description Checks that method always returns true on an empty list.
 * @author iefremov
 * @reviewer pagolubev
 * @reviewer msyabro
 * @reviewer varlax
 */


main() {
  Expect.isTrue([].every(bool f(var v) {return true;}));
  Expect.isTrue(const [].every(bool f(var v) {return true;}));
  Expect.isTrue(new List.from([]).every(bool f(var v) {return true;}));
  Expect.isTrue([].every(bool f(var v) {return false;}));  
  Expect.isTrue([].every(bool f(var v) {Expect.fail("Should not be executed");}));
  
  List a = new List<String>(0);
  Expect.isTrue(a.every( bool f(String e) { return (e.isEmpty); } ));

  a = new List<int>(96547);
  Expect.isTrue(a.every( bool f(int e) { return (e == null); } ));
}
