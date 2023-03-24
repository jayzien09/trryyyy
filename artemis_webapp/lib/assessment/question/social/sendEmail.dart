import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SendEmail extends StatelessWidget {
  final String _name = 'Artemis';
  final String _message = 'link to survey';
  final String _email = 'artemis.esg2022@gmail.com';
  final String _subject = 'Survey';
  final List<String> emails = [
    'philiplanceparungao@gmail.com',
    'parungaolance@gmail.com',
    'wesafeproject@gmail.com',
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email Selector',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Email Selector'),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text('Send Emails'),
            onPressed: () async {
              List<String> selectedEmails = _selectEmails(emails, 3);
              for (var i = 0; i < selectedEmails.length; i++) {
                _sendEmail(
                    to_email: selectedEmails[i],
                    name: _name,
                    email: _email,
                    message: _message,
                    subject: _subject);
              }
            },
          ),
        ),
      ),
    );
  }

  List<String> _selectEmails(List<String> emails, int count) {
    if (count > emails.length) {
      count = emails.length;
    }
    List<String> selectedEmails = [];
    Random random = Random();
    while (selectedEmails.length < count) {
      String email = emails[random.nextInt(emails.length)];
      if (!selectedEmails.contains(email)) {
        selectedEmails.add(email);
      }
    }
    return selectedEmails;
  }

  Future _sendEmail({
    required String name,
    required String email,
    required String subject,
    required String message,
    required String to_email,
  }) async {
    final serviceId = 'service_xbimx4h';
    final templateId = 'template_21caqfc';
    final userId = 'Hxk3-zDvuGwcnq4LZ';

    final url = Uri.parse("https://api.emailjs.com/api/v1.0/email/send");
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'service_id': serviceId,
        'template_id': templateId,
        'user_id': userId,
        'template_params': {
          'to_email': to_email,
          'user_name': name,
          'user_email': email,
          'user_subject': subject,
          'user_message': message,
        }
      }),
    );
  }
}
