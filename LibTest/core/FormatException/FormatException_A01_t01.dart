/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion Creates a new FormatException with an optional error message.
 * @description Checks that this constructor executes without error with or
 * without String arguments (including null).
 * @author rodionov
 */
 
main() {
  new FormatException();
  new FormatException(null);
  new FormatException("asdgfsdjkg");
  new FormatException("");
  new FormatException("You are not paid to think!");
}
