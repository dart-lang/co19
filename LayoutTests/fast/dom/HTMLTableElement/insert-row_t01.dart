/*
 * Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
 * for details. All rights reserved. Use of this source code is governed by a
 * BSD-style license that can be found in the LICENSE file.
 */
/**
 * @description 
 */
import "dart:html";
import "../../../testcommon.dart";

main() {
  var style = new Element.html('''
    <style>
    table {
        display: none;
    }
    </style>
    ''', treeSanitizer: new NullTreeSanitizer());
  document.head.append(style);

  document.body.setInnerHtml('''
    <h3>HTMLTableElement's insertRow() method</h3>
    <h4>The first three test whether HTMLTableElement's insertRow() method can add an implicit tbody into a table without one, to hold the inserted row.</h4>
    <p>The first tests an empty table</p>
    <p>The second tests a table with text contents.</p>
    <p>The third tests a table with only a form element inside.</p>
    <h4>The next four test the method on typical cases.</h4>
    <p>The first tests a table with only a thead</p>
    <p>The second tests a table with only a tbody</p>
    <p>The third tests a table with only a tfoot</p>
    <p>The fourth tests a table with a few rows and cells</p>
    <table></table>
    <table> </table>
    <table><form></form></table>
    <table><thead></thead></table>
    <table><tbody></tbody></table>
    <table><tfoot></tfoot></table>
    <table id="table7" width="100%" border="0" cellpadding="2" cellspacing="0" bgcolor="#cccccc" style="border-top: 1px #999999 solid; border-bottom: 5px #000000 solid">
    <tr>
             <td valign="middle" nowrap style="border-bottom: 2px #999999 solid" width="100%"><font face="arial, sans-serif" size="-2"><a href="http://www.ostg.com" title="OSTG - The Open Source Technology Group" style="text-decoration:none"><font face="verdana" color="#001670">&nbsp;<b>OSTG</b></font></a>&nbsp;|&nbsp;<a href="http://sf.net" style="text-decoration: none">SourceForge</a> -&nbsp;<a href="http://thinkgeek.com" style="text-decoration: none">ThinkGeek</a> -&nbsp;<a href="http://slashdot.org/relocate.pl?id=12076d9d1d102290bbd8d6c328d9352d" style="text-decoration: none">ITMJ</a>  -&nbsp;<a href="http://linux.com" style="text-decoration: none">Linux.com</a> -&nbsp;<a href="http://newsforge.com" style="text-decoration: none">NewsForge</a> -&nbsp;<a href="http://freshmeat.net" style="text-decoration: none">freshmeat</a> -&nbsp;<a href="http://newsletters.ostg.com" style="text-decoration: none">Newsletters</a> -&nbsp;<a href="http://slashdot.org/relocate.pl?id=0bd85aa57f4ab88f2d01c33b548b693c" style="text-decoration: none">Jobs</a> -&nbsp;<a href="http://slashdot.org/relocate.pl?id=776713765547209fc2c05a83454efda2" style="text-decoration: none">Broadband</a> -&nbsp;<a href="http://slashdot.org/relocate.pl?id=237ae3c6bbb4992f4144befc67856103" style="text-decoration: none">Whitepapers</a></font></td><td valign="middle" style="display:hidden; border-bottom: 2px solid #999999" nowrap><b><A HREF="//slashdot.org/users.pl?op=savemiscopts&amp;opt_osdn_navbar=0" style="text-decoration: none;"><font size="-2" face="verdana" color="#666666">&nbsp;X&nbsp;</font></a></b>
             </td>
    </tr>
    </table>
            <hr>
            <ol id="console"></ol>
    ''', treeSanitizer: new NullTreeSanitizer());

  insert(table) {
    var insertedRow = table.insertRow(-1);
    // Check that the insertedRow is in the table and that the table now has at least one tBody
    debug('in table');
    shouldBeTrue(table.rows.contains(insertedRow));
    debug('tBodies');
    shouldBeTrue(table.tBodies.length > 0);
    debug('tFoot');
    shouldBeNonNull(table.tFoot);
    debug('tHead');
    shouldBeNonNull(table.tHead);
  }

  List tables = document.getElementsByTagName("table");
  for(var i = 0; tables[i]; i++)
    insert(tables[i]);
}
