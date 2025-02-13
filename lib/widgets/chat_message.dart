import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  const ChatMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chat')
            .orderBy('createdAt', descending: false)
            .snapshots(),
        builder: (ctx, chatSnapshots) {
          if (chatSnapshots.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!chatSnapshots.hasData || chatSnapshots.data!.docs.isEmpty) {
            return const Center(
              child: Text('No message found.'),
            );
          }

          if (chatSnapshots.hasError) {
            return const Center(
              child: Text('Something went Wrong.....'),
            );
          }

          final loadedmessages = chatSnapshots.data!.docs;

          return ListView.builder(
              itemCount: loadedmessages.length,
              itemBuilder: (ctx, index) =>
                  Text(loadedmessages[index].data()['text']));
        });
  }
}
