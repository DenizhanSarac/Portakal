import 'dart:io';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'menu.dart';
import 'navigation_controls.dart';
import 'web_view_stack.dart';


class mainPage extends StatefulWidget {
  User user;
  mainPage({required this.user, this.title});
  final String? title;

  @override
  mainPageState createState() => mainPageState();

}

class mainPageState extends State<mainPage>{
  final Completer<WebViewController> _controller = Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portakal Tarayıcı'),
        actions: [
          NavigationControls(controller: _controller),
          Menu(controller: _controller),                // Add this line
        ],
      ),
      body: WebViewStack(controller: _controller),
    );
  }

}