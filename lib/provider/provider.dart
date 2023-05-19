import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_test/websocket/websocketclient.dart';

final counterProvider = StateProvider((ref) => 0);

final counterProviderStream = StreamProvider.family<int, int>((ref, start) {
  final wsClient = ref.watch(websocketClientProvider);
  return wsClient.getCounterStream(start);
});

final websocketClientProvider = Provider<WebsocketClient>((ref) {
  return FakeWebsocketClient();
});