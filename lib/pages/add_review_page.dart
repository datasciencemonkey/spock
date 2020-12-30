import 'dart:convert';
// import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:omnikit/services/review_service.dart';

class Review extends StatefulWidget {
  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  TextEditingController _controller = new TextEditingController();
  // bool _showAnalysis = false;
  dynamic _response;
  dynamic _sentimentResponse;
  String _sentiment;
  var _resolvedEntities = Map();
  dynamic _keyPhrases;
  dynamic _entities;
  ReviewService _reviewService = ReviewService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a review'),
        elevation: 0.0,
      ),
      body: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: _controller,
                  cursorColor: Colors.black,
                  autocorrect: false,
                  decoration: InputDecoration(
                    hintText: "Write your review here",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                      borderSide: BorderSide(
                        color: Colors.amber,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                  maxLines: 8,
                ),
              ),
            ],
          ),
          FlatButton(
            color: Theme.of(context).primaryColor,
            child: Text('Submit review',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2.0,
                ),
                textAlign: TextAlign.center),
            onPressed: () async {
              print('Review submitted : ${_controller.text}');
              Map<String, dynamic> payload = {
                "documents": [
                  {"id": "1", "text": _controller.text}
                ]
              };

              await _reviewService
                  .runTextAnalysisforLanguageDetection(payload)
                  .then((value) => _response =
                      value['documents'][0]['detectedLanguages'][0]['name']);

              if (_response == 'English') {
                await _reviewService
                    .runTextAnalysisforSentimentAnalysis(payload)
                    .then((value) =>
                        _sentimentResponse = value['documents'][0]['score']);
                print(_sentimentResponse);
                _sentiment = _processSentiment(_sentimentResponse);
                await _reviewService
                    .runTextAnalysisforKeyPhraseAnalysis(payload)
                    .then((value) =>
                        _keyPhrases = value['documents'][0]['keyPhrases']);

                await _reviewService
                    .runTextAnalysisforEntityAnalysis(payload)
                    .then((value) =>
                        _entities = value['documents'][0]['entities']);

                _keyPhrases.forEach((val) => print('Key Phrase: $val'));
                JsonEncoder encoder = new JsonEncoder.withIndent('  ');
                _resolvedEntities.clear();
                _entities.forEach((val) {
                  String prettyVal = encoder.convert(val);
                  _resolvedEntities.putIfAbsent(val['type'], () => val['name']);
                  // print(_resolvedEntities);
                  print("INFO: Entity Analysis Result: $prettyVal");
                  print("Entity Name:${val['name']}");
                  print("Entity Type:${val['type']}");
                });
              } else {
                print('submit english response');
              }
              Get.defaultDialog(
                title: 'Cloud AI Analysis Result',
                backgroundColor: Colors.black,
                titleStyle: TextStyle(color:Colors.blueGrey),
                content: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Detected Language: $_response',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Sentiment Score: $_sentiment',
                        style: TextStyle(color: Colors.white),
                      ),
                      _keyPhrases.length > 0
                          ? Text(
                              'Key Phrases: $_keyPhrases',
                              style: TextStyle(color: Colors.white),
                            )
                          : Text(''),
                      _entities.length > 0
                          ? Text(
                              'Entities: $_resolvedEntities',
                              style: TextStyle(color: Colors.white),
                            )
                          : Text(''),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  String _processSentiment(double score) {
    String sentiment;
    if (score < .3) {
      sentiment = 'Negative';
    } else if ((score >= .3) && (score <= .5)) {
      sentiment = 'Neutral';
    } else if (score >= .5) {
      sentiment = 'Positive';
    }
    return sentiment;
  }
}
