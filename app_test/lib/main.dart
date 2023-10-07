// Created by Genilson do Carmo Silva on 06/10/23.

import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white70,
        appBar: AppBar(
          title: const Text(
            "Genilson do Carmo",
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.brown[900],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                'images/BannerClear.png',
                width: 450.0,
                height: 130.0,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 200.0),
              const ClipOval(
                child: Image(
                  image: NetworkImage(
                      "https://avatars.githubusercontent.com/u/57676824?s=400&u=69de258da6f81f9a78273dbc51f4b0c1d30133f2&v=4"),
                  width: 400.0,
                  height: 400.0,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
