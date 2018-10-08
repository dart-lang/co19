/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Ensuring that mutation event with text modification on a
 * textarea doesn't crash
 */
import "dart:html";
import "../../testcommon.dart";

main() {
  var span = document.createElementNS("http://www.w3.org/1999/xhtml", "span");
  document.implementation.createDocument("", "", null).adoptNode(span);

  var textarea = document.createElementNS("http://www.w3.org/1999/xhtml", "textarea");
  textarea.text = "Value";
  textarea.addEventListener("DOMCharacterDataModified", (evt) { window.console.log(evt.target); textarea.text = ""; }, false);
  document.body.append(textarea);

  var text = new Text("Hello?");
  textarea.append(text);
  span.append(text);

  testPassed("unless crash.");
}
