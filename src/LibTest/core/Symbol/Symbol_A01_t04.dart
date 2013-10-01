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
 * @description Checks that ArgumentError is thrown if name is not a String.
 * @author ilya
 * @issue 13715
 */
import "../../../Utils/expect.dart";

main() {
  Expect.throws(() {
    new Symbol(null);
    }, (e) => e is ArgumentError);

  Expect.throws(() {
    new Symbol(new Symbol(''));
    }, (e) => e is ArgumentError);
}

