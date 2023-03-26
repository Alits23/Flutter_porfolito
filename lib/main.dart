import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return getApplication();
  }

  Widget getApplication() {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: _getAppbar(),
        body: _getBody(),
      ),
    );
  }

  //AppBar

  PreferredSizeWidget _getAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.redAccent,
      title: Center(
        child: Text('علی تشکری صباغ'),
      ),
    );
  }

  //body

  Widget _getBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
              ),
              _BodyHead(),
              _bodyIcons(),
              SizedBox(
                height: 15,
              ),
              _getSkillCards(),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                child: Container(
                  width: double.infinity,
                  height: 2,
                  color: Color.fromARGB(31, 69, 69, 69),
                ),
              ),
              _getResume(),
            ],
          ),
        ),
      ),
    );
  }
}

//text information

Widget _BodyHead() {
  return Column(
    children: [
      SizedBox(
        height: 10,
      ),
      CircleAvatar(
        backgroundImage: AssetImage('images/user.png'),
        radius: 60,
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        'علی تشکری صباغ',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w900,
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          'متولد شهر مشهد و دانشجوی مهندسی کامپیوتر از دانشگاه هاروارد , علاقه زیاد به برنامه نویسی و فلاتر ',
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}

// icons social media

Widget _bodyIcons() {
  return Wrap(
    spacing: 20,
    alignment: WrapAlignment.center,
    runSpacing: 15,
    children: [
      //instagram
      IconButton(
        onPressed: () {
          _launchURL(
              'https://instagram.com/ali.tashakori.23?igshid=ZDdkNTZiNTM=');
        },
        icon: FaIcon(FontAwesomeIcons.squareInstagram),
        color: Colors.redAccent,
        iconSize: 30,
      ),
      //telegram
      IconButton(
        onPressed: () {
          _launchURL('https://t.me/alits23');
        },
        icon: FaIcon(FontAwesomeIcons.telegram),
        color: Colors.redAccent,
        iconSize: 30,
      ),
      //Linkdin
      IconButton(
        onPressed: () {
          _launchURL('https://www.linkedin.com/in/ali-tashakori-7a974a258');
        },
        icon: FaIcon(FontAwesomeIcons.linkedin),
        color: Colors.redAccent,
        iconSize: 30,
      ),
      //Github
      IconButton(
        onPressed: () {
          _launchURL('https://github.com/Alits23');
        },
        icon: FaIcon(FontAwesomeIcons.github),
        color: Colors.redAccent,
        iconSize: 30,
      ),
    ],
  );
}

//Skill Cards

Widget _getSkillCards() {
  var list = ['C++', 'Android', 'Flutter', 'Dart', 'Java'];
  return Wrap(
    alignment: WrapAlignment.center,
    runSpacing: 25,
    children: [
      for (var skill in list)
        Card(
          elevation: 10,
          shadowColor: Colors.redAccent,
          child: Column(
            children: [
              Container(
                height: 70.0,
                child: Image(
                  image: AssetImage('images/$skill.png'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  "$skill",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
    ],
  );
}

//Column History Resume

Widget _getResume() {
  return Container(
    width: double.infinity,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            'سابقه کاری',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w900,
            ),
          ),
          // var rezomelist=['Elits موسس و بنیان گذار','برنامه نویس فلاتر از سال 1401 در home'];
          SizedBox(
            height: 12,
          ),
          _ListResume(),
        ],
      ),
    ),
  );
}

//list Resume

Widget _ListResume() {
  var listresume = [
    'موسس و بنیان گذار Elits',
    'برنامه نویس فلاتر از سال 1401 در home',
    'null',
    'null',
    'null',
    'null',
    'null',
    'null',
    'null',
    'null',
    'null',
    'null',
    ' :) ',
  ];
  return Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      SizedBox(
        width: double.infinity,
        height: 20,
      ),
      for (var resume in listresume)
        Text(
          '- $resume',
          textDirection: TextDirection.rtl,
        ),
    ],
  );
}

//links

_launchURL(String url) async {
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    throw 'Could not launch $url';
  }
}
