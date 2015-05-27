/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion factory Symbol(String name)
 * Constructs a new Symbol.
 * An ArgumentError is thrown if name starts with an underscore, or if name is
 * not a String. An ArgumentError is thrown if name is not an empty string
 * and is not a valid qualified identifier optionally followed by '='.
 * @description Checks that there are errors if correct arguments are used and
 * created objects equal to corresponding symbol literals.
 * @author ilya
 * @reviewer
 */
import "../../../Utils/expect.dart";

main() {
  Expect.equals(#foo, new Symbol('foo'));
  Expect.equals(#foo.bar$, new Symbol(r'foo.bar$'));
  //#foo.bar$.baz_= is not valid syntax for string literal
  new Symbol(r'foo.bar$.baz_=');
  
  Expect.equals(#foo, const Symbol('foo'));
  Expect.equals(#foo.bar$, const Symbol(r'foo.bar$'));
  const Symbol(r'foo.bar$.baz_=');
}

