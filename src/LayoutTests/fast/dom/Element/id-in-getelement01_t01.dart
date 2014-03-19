/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test getElementById
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  document.body.setInnerHtml('''
    <div name='name1' id='id1'/>
    <div name='name2' id='id2'/>
    <div name='name3' id='id2'/>
    ''', treeSanitizer: new NullTreeSanitizer());

  var elem;

  // element found with exact match
  elem = document.getElementById('id1');
  Expect.equals("name1", elem.getAttribute("name"));

  // multiple elements having same id return the first one
  elem = document.getElementById('id2');
  Expect.equals("name2", elem.getAttribute("name"));

  // element with id not found
  elem = document.getElementById('id3');
  Expect.isNull(elem);
}
