import 'package:flutter/material.dart';
import 'package:flutter_application_1/domain/entities/message.dart';
import 'package:flutter_application_1/presentation/providers/chat_provider.dart';
import 'package:flutter_application_1/presentation/widgets/chat/her_message_bubble.dart';
import 'package:flutter_application_1/presentation/widgets/chat/my_message_bubble.dart';
import 'package:flutter_application_1/presentation/widgets/shared/message_field_box.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://imgs.search.brave.com/xTKnNYz1vrJfZh-x5htyiH4PPjA-G-dHsSLX3hfr51o/rs:fit:860:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTE5/MTUwNzYxNS9lcy9m/b3RvL2hlcm1vc2Et/bXVqZXItcG9zYW5k/by1lbi1sYS1jJUMz/JUExbWFyYS5qcGc_/cz02MTJ4NjEyJnc9/MCZrPTIwJmM9RDhk/Y2NIVWM3OGxOYnd0/MGFLMzU5MUZNVmxm/N2tGVVRTU05wVERk/dkd1Zz0'),
            ),
          ),
          title: const Text('Mi amor (L)'),
        ),
        body: _ChatView());
  }
}

class _ChatView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final chatProvider = context.watch<ChatProvider>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: chatProvider.scrollController,
                itemCount: chatProvider.messages.length,
                itemBuilder: (context, index) {
                  final message = chatProvider.messages[index];
                  return message.fromWho == FromWho.hers
                      ? HerMessageBubble(message: message)
                      : MyMessageBubble(message: message);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: MessageFieldBox(
                onValue: chatProvider.sendMessage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
