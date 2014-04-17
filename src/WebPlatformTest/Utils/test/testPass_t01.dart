/*
 * Copyright (c) 2011, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description test just passes
 */
import 'dart:html';
import "../expectWeb.dart";

main() {
test(() {
  var comment = new Comment();
  assert_true(comment is Node, "Should be a Node");
  assert_true(comment is CharacterData, "Should be a CharacterData");
  assert_true(comment is Comment, "Should be a Comment");
}, "new Comment(): is");

checkTestFailures();
}
