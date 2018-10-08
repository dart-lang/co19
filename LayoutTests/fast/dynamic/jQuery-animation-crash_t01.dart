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
      <p>Test for <a href="https://bugs.webkit.org/show_bug.cgi?id=25381">bug 25381</a>:
      jQuery animation crashing Safari.</p>
      <p>PASS if didn't crash.</p>
      <div style="position:fixed; top:0px; width:100px; background:red;">
          <div id="i" style="position:fixed; display:none; top:0px; width:100px; height:100px; overflow:hidden; background:green;"><div>ABC</div></div>
      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  swap( elem, options, callback ) {
    var old = {};
    // Remember the old values, and insert the new ones
    for ( var name in options.keys ) {
      old[name] = elem.style.getPropertyValue(name);
      elem.style.setProperty(name, options[name]);
    }

    callback();

    // Revert the old values
    for ( var name in options.keys ) {
      elem.style.setProperty(name, old[name]);
    }
  }

  forceLayout()
  {
    document.body.offsetTop;
  }

  asyncStart();
  setTimeout(() {
    var elem = document.getElementById('i');
    elem.style.setProperty('display', 'block');

    var val, props = { 'position': "absolute", 'visibility': "hidden", 'display':"block" };
    getWH() {
      val = elem.offsetHeight;
    }
    swap( elem, props, getWH );

    forceLayout();
    elem.style.setProperty('height', '2');
    forceLayout();
    elem.style.setProperty('height', '3');
    forceLayout();
    elem.style.setProperty('display', 'none');
    forceLayout();
    asyncEnd();
  }, 0); 
}
