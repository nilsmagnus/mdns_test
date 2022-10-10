# mdns_test

My code when mdns_multicast fails.

    Reloaded 1 of 600 libraries in 278ms (compile: 32 ms, reload: 73 ms, reassemble: 131 ms).
    [VERBOSE-2:dart_vm_initializer.cc(41)] Unhandled Exception: SocketException: Send failed (OS Error: No route to host, errno = 65), address = 0.0.0.0, port = 5353
    #0      _NativeSocket.send (dart:io-patch/socket_patch.dart:1213:34)
    #1      _RawDatagramSocket.send (dart:io-patch/socket_patch.dart:2460:15)
    #2      MDnsClient.lookup (package:multicast_dns/multicast_dns.dart:225:14)
    #3      _MyHomePageState._startScan (package:mdns_test/main.dart:76:10)
    <asynchronous suspension>