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
  document.body.setInnerHtml('''
      <div id='labo'></div>
      <div id='labo2'></div>
      <div id='labo3'><form><select name='labo3' id='labo3'><option>1</option><option>2</option></select><form></div>
      <div id='labo4'><span name='labo4' id='labo4'></span></div>
      ''', treeSanitizer: new NullTreeSanitizer());

  document.getElementById('labo').innerHtml = "<form><select name='labo' id='labo'><option>1</option><option>2</option></select><form>";
  var sel = document.getElementById("labo");
  shouldBeTrue(sel is DivElement);

  document.getElementById('labo2').innerHtml = "<span id='labo2'></<span>";
  sel = document.getElementById("labo2");
  shouldBeTrue(sel is DivElement);

  sel = document.getElementById("labo3");
  shouldBeTrue(sel is DivElement);

  sel = document.getElementById("labo4");
  shouldBeTrue(sel is DivElement);
}
