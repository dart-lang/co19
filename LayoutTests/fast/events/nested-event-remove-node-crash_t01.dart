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
import "pwd.dart";

main() {
  document.body.setInnerHtml('''
      <div id="replaceMe">

      <div>
      <select id="theSelect">
      </select>
      </div>

      </div>
      ''', treeSanitizer: new NullTreeSanitizer());

  var XHR = [];
  var numXHRs = 0;
  var run = 0;

  callback(response)
  {
    document.getElementById("replaceMe").innerHtml = "";
    document.getElementById("replaceMe").innerHtml = response;
    if (run == 2) {
      asyncEnd();
    }
  }

  handleStateChange(_)
  {
    if ((XHR[0].readyState == 4) && (run < 2)) { // yes this looks wrong but it's how to reproduce the bug
      run = run + 1;
      callback(XHR[0].responseText);
    }
  }

  sendXHR()
  {
    XHR.add(null);
    XHR[numXHRs] = new HttpRequest();
    XHR[numXHRs].onReadyStateChange.listen(handleStateChange);
    XHR[numXHRs].open("GET", "$root/nested-event-remove-node-crash-expected.txt", async:true);
    XHR[numXHRs].send(null);
    numXHRs = numXHRs + 1;
  }

  var theSelect = document.getElementById("theSelect");

  theSelect.onBlur.listen((_) {
    sendXHR();
    gc();
  });

  test()
  {
    /*
       1. focus a node
       2. send an XHR who's handler will remove the node
       3. the focused node's onblur will fire
       4. the onblur event handler will send off an XHR who's handler will remove the node
     */

    asyncMultiStart(2);

    theSelect.focus();
    sendXHR();

  }

  test();
}
