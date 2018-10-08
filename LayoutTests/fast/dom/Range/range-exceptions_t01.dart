/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description This test checks some DOM Range exceptions.
 */
import "dart:html";
import "../../../testcommon.dart";

_shouldThrow(func(), name) =>
  shouldThrow(func, (e) => e is DomException && e.name == name);

main() {
  // Test to be sure the name BAD_BOUNDARYPOINTS_ERR dumps properly.
  var node = document.createElement("DIV");
  node.setInnerHtml("<BAR>AB<MOO>C</MOO>DE</BAR>",
      treeSanitizer: new NullTreeSanitizer());
  shouldBe(node.innerHtml, '<bar>AB<moo>C</moo>DE</bar>');

  // Ensure that we throw BAD_BOUNDARYPOINTS_ERR when trying to split a comment
  // (non-text but character-offset node). (Test adapted from Acid3.)
  var c1 = new Comment("aaaaa");
  node.append(c1);
  var c2 = new Comment("bbbbb");
  node.append(c2);
  var r = document.createRange();
  r.setStart(c1, 2);
  r.setEnd(c2, 3);
  _shouldThrow(() => r.surroundContents(document.createElement('a')),
     DomException.INVALID_STATE);

  // But not when we don't try to split the comment.
  r.setStart(c1, 0);
  r.setEnd(c1, 5);
  _shouldThrow(() => r.surroundContents(document.createElement('a')),
     DomException.HIERARCHY_REQUEST);
}

