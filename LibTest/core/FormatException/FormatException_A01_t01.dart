// Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion FormatException([String message = "", dynamic source, int offset])
/// Creates a new FormatException with an optional error message.
/// @description Checks that this constructor executes without error with String
/// arguments.
/// @author rodionov

 
main() {
  new FormatException();
  new FormatException("asdgfsdjkg");
  new FormatException("");
  new FormatException("You are not paid to think!");
}
