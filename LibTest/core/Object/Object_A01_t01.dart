/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @assertion const Object()
 * Creates a new Object instance.
 * Object instances have no meaningful state, and are only useful through their
 * identity. An Object instance is equal to itself only.
 * @description Checks that a new Object can be created without errors.
 * @author rodionov
 */
 
main() {
  new Object();
  const Object();
}
