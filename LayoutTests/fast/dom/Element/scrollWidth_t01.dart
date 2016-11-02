/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description Test the value of scrollWidth on blocks with visible overflow.
 * These results match IE8.
 */
import "dart:html";
import "../../../../Utils/expect.dart";
import "../../../testcommon.dart";

main() {
  var style = new Element.html('''
    <style>
        #container > div {
            width: 50px;
            height: 50px;
            border-width: 5px 5px 10px 10px;
            border-style: solid;
            margin: 10px;
        }
    
        #container > div > div {
            width: 75px;
            height: 25px;
            background-color: lightblue;
        }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);
 
  document.body.setInnerHtml('''
    <pre id="console"></pre>
    <div id="container">
        <div>
            <div></div>
        </div>
    
        <div>
            <div style="margin-left: 9px;"></div>
        </div>
    
        <div>
            <div style="margin-right: 9px;"></div>
        </div>
    
        <div>
            <div style="margin-left: -27px;"></div>
        </div>
    
        <div>
            <div style="position: relative;"></div>
        </div>
    
        <div>
            <div style="position: relative; left: 9px;"></div>
        </div>
    
        <div>
            <div style="position: relative; left: -9px;"></div>
        </div>
    
        <div>
            <div style="position: relative; left: -27px;"></div>
        </div>

        <div>
            <div style="position: absolute;"></div>
        </div>
    </div>
    ''', treeSanitizer: new NullTreeSanitizer());

  log(message)
  {
    document.getElementById("console").append(new Text(message + "\n"));
  }

  testDiv(div)
  {
    var childStyle = div.querySelector('div').style;
    var cssText = childStyle.cssText;
    if (cssText != '') cssText += " ";
    log(cssText + "-> scrollWidth: " + div.scrollWidth.toString());
  }

  var container = document.getElementById("container");

  log ("LTR:");
  for (var d = container.querySelector('div'); d != null; d = d.nextElementSibling)
    testDiv(d);

  container.style.direction = "rtl";
  log ("\nRTL:");
  for (var d = container.querySelector('div'); d != null; d = d.nextElementSibling)
    testDiv(d);

  var expected = '''
LTR:
-> scrollWidth: 75
margin-left: 9px; -> scrollWidth: 84
margin-right: 9px; -> scrollWidth: 75
margin-left: -27px; -> scrollWidth: 50
position: relative; -> scrollWidth: 75
position: relative; left: 9px; -> scrollWidth: 84
position: relative; left: -9px; -> scrollWidth: 66
position: relative; left: -27px; -> scrollWidth: 50
position: absolute; -> scrollWidth: 50

RTL:
-> scrollWidth: 75
margin-left: 9px; -> scrollWidth: 75
margin-right: 9px; -> scrollWidth: 84
margin-left: -27px; -> scrollWidth: 75
position: relative; -> scrollWidth: 75
position: relative; left: 9px; -> scrollWidth: 66
position: relative; left: -9px; -> scrollWidth: 84
position: relative; left: -27px; -> scrollWidth: 102
position: absolute; -> scrollWidth: 50
''';

  Expect.equals(expected, document.getElementById("console").text);

} 
