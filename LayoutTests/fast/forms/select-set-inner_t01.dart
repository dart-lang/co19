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
      <p>This tests a case where removing an option element from a select by using innerHTML would cause a crash.</p>

      <p id="result">FAIL</p>

      <select id="select">
         <option>here is one</option>
         <optgroup id="group" label="group"><option>here is another</option></optgroup>
      </select>
      ''', treeSanitizer: new NullTreeSanitizer());

  SelectElement select = document.getElementById('select');
  select.length; // cause the <select> element to build a list of options
  document.getElementById('group').innerHtml = ""; // remove an option using innerHTML
  select.length; // cause the <select> element to use the list of options
  select.innerHtml = ""; // remove the other option using innerHTML
  select.length; // cause the <select> element to use the list of options

  document.getElementById('result').innerHtml = "PASS";
}
