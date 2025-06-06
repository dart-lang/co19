// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// @assertion Future<RawSecureSocket> single
/// The single element of this stream.
/// . . .
/// If this [Stream] is empty or has more than one element, the returned future
/// completes with an error.
///
/// @description Checks that if this [Stream] has more than one element, the
/// returned future completes with an error.
/// @author ngl@unipro.ru

// OtherResources=server_chain.pem
// OtherResources=server_key.pem
// OtherResources=trusted_certs.pem
import "dart:io";
import "dart:async";
import "../../../Utils/expect.dart";

String localFile(path) => Platform.script.resolve(path).toFilePath();

SecurityContext serverContext = new SecurityContext()
  ..useCertificateChain(localFile('server_chain.pem'))
  ..usePrivateKey(localFile('server_key.pem'),
      password: 'co19test');

SecurityContext clientContext = new SecurityContext()
  ..setTrustedCertificates(localFile('trusted_certs.pem'));

check(InternetAddress address) {
  const messageSize = 10;
  final List<int> expected = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  final List<RawSecureSocket?> sList = [null, null];
  int sli = 0;
  var closed = 0;
  Completer mainCompleter = Completer();
  RawSecureServerSocket.bind(address, 0, serverContext).then((server) {
    Stream<RawSecureSocket> bs = server.asBroadcastStream();

    mainCompleter.future.then((_) {
      bs.single.then((event) async {
        Expect.fail('Future should be completed with Error');
      }, onError: (error) {
        Expect.isTrue(error is StateError);
        asyncEnd();
      });
    });

    bs.listen((client) {
      int bytesRead = 0;
      int bytesWritten = 0;
      List<int> data = new List<int>.filled(messageSize, 0);
      client.writeEventsEnabled = false;
      sList[sli++] = client;
      client.listen((event) {
        switch (event) {
          case RawSocketEvent.read:
            Expect.isTrue(client.available() > 0);
            var buffer = client.read();
            if (buffer != null) {
              data.setRange(bytesRead, bytesRead + buffer.length, buffer);
              bytesRead += buffer.length;
              Expect.listEquals(expected, buffer);
            }
            if (bytesRead == data.length) {
              Expect.listEquals(expected, data);
              client.writeEventsEnabled = true;
            }
            break;
          case RawSocketEvent.write:
            Expect.listEquals(expected, data);
            bytesWritten +=
                client.write(data, bytesWritten, data.length - bytesWritten);
            if (bytesWritten < data.length) {
              client.writeEventsEnabled = true;
            }
            if (bytesWritten == data.length) {
              client.shutdown(SocketDirection.send);
            }
            break;
          case RawSocketEvent.readClosed:
            closed++;
            break;
          default:
            throw "Unexpected event $event";
        }
      }).onDone(() {
        if (closed == 1) {
          server.close();
        }
      });
    });


    for (int i = 1; i <= 2; i++) {
      RawSocket.connect(server.address, server.port).then((socket) {
        RawSecureSocket.secure(socket, context: clientContext).then((client) {
          var completer = new Completer();
          int bytesRead = 0;
          int bytesWritten = 0;
          final List<int> dataSent = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
          final List<int> dataReceived = List<int>.filled(dataSent.length, 0);
          client.listen((event) {
            switch (event) {
              case RawSocketEvent.read:
                Expect.isTrue(client.available() > 0);
                var buffer = client.read();
                if (buffer != null) {
                  dataReceived.setRange(
                      bytesRead, bytesRead + buffer.length, buffer);
                  bytesRead += buffer.length;
                }
                break;
              case RawSocketEvent.write:
                Expect.isTrue(bytesRead == 0);
                bytesWritten += client.write(
                    dataSent, bytesWritten, dataSent.length - bytesWritten);
                break;
              case RawSocketEvent.readClosed:
                completer.complete(client);
                break;
              default:
                throw "Unexpected event $event";
            }
          });
          completer.future.then((_) {
            socket.close();
            if (i == 2) {
              mainCompleter.complete();
            }
          });
        });
      });
    }

  });
}

main() {
  asyncStart(2);
  check(InternetAddress.loopbackIPv4);
  check(InternetAddress.loopbackIPv6);
}
