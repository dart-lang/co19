/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var element1 = document.createElement("x");
  var element2 = document.createElement("x");
  var element3 = document.createElement("x");
  var parent   = document.createElement("x");
  var dummy    = document.createElement("x");

  var doc;

  handler(_)
  {
    element1.removeEventListener("DOMNodeRemoved", handler, false);
    doc.adoptNode(element1.parent);
  }

  doc = document.implementation.createHtmlDocument('');

  debug('append');
  parent.append(element1);
  element1.addEventListener("DOMNodeRemoved", handler, false);
  try {
    document.body.append(element1);
  } catch (e) { }
  shouldBeTrue(element1.ownerDocument == element1.parent.ownerDocument);

  debug('insertBefore');
  document.adoptNode(parent);
  parent.append(element2);
  try {
    doc.body.insertBefore(element2, dummy);
  } catch (e) { }
  shouldBeTrue(element2.ownerDocument == element2.parent.ownerDocument);

  debug('replaceWith');
  parent.append(element3);
  try {
    dummy.replaceWith(element3);
  } catch (e) { }
  shouldBeTrue(element3.ownerDocument == element3.parent.ownerDocument);
}
