import 'package:flutter/material.dart';

class ChatCard extends StatelessWidget {
  final String senderName;
  final String message;
  final String timestamp;
  final bool isSender;

  const ChatCard({
    Key? key,
    required this.senderName,
    required this.message,
    required this.timestamp,
    this.isSender = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      child: Card(
        color: isSender ? Colors.blue[100] : Colors.grey[300],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              if (!isSender)
                Text(
                  senderName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              const SizedBox(height: 5),
              Text(
                message,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 5),
              Text(
                timestamp,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
