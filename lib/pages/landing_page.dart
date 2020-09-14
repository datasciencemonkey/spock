import 'package:flutter/material.dart';
import 'package:omnikit/data/data.dart';
import 'package:omnikit/widgets/widgets.dart';

class LandingPage extends StatefulWidget {
  final String email;

  const LandingPage({
    Key key,
    this.email,
  }) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  ScrollController _scrollController;
  double _scrollOffset = 0.0;
 

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() { 
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      // Color(0xfff6f6f6)
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        child: CustomAppBar(
          scrollOffset: _scrollOffset,
        ),
        preferredSize: Size(screenSize.width, 50.0),
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: ContentHeader(
              featuredContent: retailContent,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              top: 20.0,
            ),
            sliver: SliverToBoxAdapter(
              child: Deals(
                title: 'My Top Saver Deals',
                contentList: deals,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              title: 'My Recommendations',
              contentList: myList,
            ),
          ),
          SliverToBoxAdapter(
            child: ContentList(
              title: 'OK Time Video',
              contentList: originals,
              isOriginals: true,
            ),
          ),
        ],
      ),
    );
  }
}
