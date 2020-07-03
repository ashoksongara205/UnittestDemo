import 'dart:async';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutterappunittest/common/colors.dart';
import 'package:flutterappunittest/common/enums.dart';
import 'package:flutterappunittest/ui/employee_detail_page.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../common/theme_dimensions.dart';
import '../common/theme_helper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WebviewDemo(),
    );
  }
}

class WebviewDemo extends StatefulWidget {
  @override
  _WebviewDemoState createState() => _WebviewDemoState();
}

class _WebviewDemoState extends State<WebviewDemo> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: "https://google.com",
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: Set.from([
          JavascriptChannel(
              name: 'Print',
              onMessageReceived: (JavascriptMessage message) {
                //This is where you receive message from
                //javascript code and handle in Flutter/Dart
                //like here, the message is just being printed
                //in Run/LogCat window of android studio
                print('Messages are ---${message.message}');
              })
        ]),
      ),
    );
  }
}

class EmployeeDetailPage extends StatefulWidget {
  @override
  _EmployeeDetailPageState createState() => _EmployeeDetailPageState();
}

class _EmployeeDetailPageState extends State<EmployeeDetailPage> {
  int currentPageIndex;
  GlobalKey<FormState> _formKey;
  GlobalKey<FormState> _seniorFormKey;
  GlobalKey<FormState> _juniorFormKey;

  int totalSenior = 2;
  int totaalJuniore = 2;
  int totalEmployee = 3;

  @override
  void initState() {
    super.initState();

    currentPageIndex = 0;
    _formKey = GlobalKey<FormState>();
    _seniorFormKey = GlobalKey<FormState>();
    _juniorFormKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: ThemeDimension.paddingLarge,
              horizontal: ThemeDimension.paddingMedium),
          child: Column(
            children: <Widget>[
              ThemeHelper.paddingTop(),
              ThemeHelper.paddingTop(padding: ThemeDimension.paddingMedium),
              navigationWidget(),
              ThemeHelper.paddingTop(),
              ThemeHelper.paddingTop(padding: ThemeDimension.paddingMedium),
              _personDetailWidget(),
              ThemeHelper.paddingTop(),
//            _nextButtonWidget()
            ],
          ),
        ),
      ),
    );
  }

  Widget navigationWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        GestureDetector(
          onTap: () => _changePage(false),
          child: Transform.rotate(
              angle: 180 * math.pi / 180,
              child: Icon(
                Icons.play_arrow,
                color: currentPageIndex == 0 ? kColorLightGrey : kColorBlack,
                size: ThemeDimension.iconSizeVeryLarge,
              )),
        ),
        ThemeHelper.titleText(context, _getPageTitle()),
        GestureDetector(
            onTap: () => _changePage(true),
            child: Icon(
              Icons.play_arrow,
              color: currentPageIndex < totalEmployee
                  ? kColorBlack
                  : kColorLightGrey,
              size: ThemeDimension.iconSizeVeryLarge,
            ))
      ],
    );
  }

  Widget _personDetailWidget() {
    return Wrap(
      children: <Widget>[getCurrentPage()],
    );
  }

  void _changePage(bool isIncrease) {
    if (isIncrease) {
      if (currentPageIndex >= 0 && currentPageIndex < totalEmployee)
        currentPageIndex++;
    } else {
      if (currentPageIndex > 0) currentPageIndex--;
    }
    setState(() {});
  }

  String _getPageTitle() {
    String title = "";
    if (currentPageIndex == 0)
      title = "Senior 1";
    else if (currentPageIndex == 1)
      title = "Senior 2";
    else if (currentPageIndex == 2)
      title = "Junior 1";
    else if (currentPageIndex == 3) {
      title = "Junior 2";
    }
    return title;
  }

  Widget getCurrentPage() {
    Widget widget = EmpDetailPage(
      personId: currentPageIndex,
      formKey: _formKey,
      key: ValueKey(currentPageIndex),
      employeeType: EmployeeType.senior,
      nextButtonCallback: nextButtonCallback,
    );
    if (currentPageIndex == 0) {
      _formKey = _seniorFormKey;
      widget = EmpDetailPage(
        personId: currentPageIndex,
        formKey: _formKey,
        key: ValueKey(currentPageIndex),
        employeeType: EmployeeType.senior,
        nextButtonCallback: nextButtonCallback,
      );
    } else if (currentPageIndex == 1) {
      _formKey = _seniorFormKey;
      widget = EmpDetailPage(
        personId: currentPageIndex,
        formKey: _formKey,
        key: ValueKey(currentPageIndex),
        employeeType: EmployeeType.senior,
        nextButtonCallback: nextButtonCallback,
      );
    } else if (currentPageIndex == 2) {
      _formKey = _juniorFormKey;
      widget = EmpDetailPage(
        personId: currentPageIndex,
        formKey: _formKey,
        key: ValueKey(currentPageIndex),
        employeeType: EmployeeType.junir,
        nextButtonCallback: nextButtonCallback,
      );
    } else if (currentPageIndex == 3) {
      _formKey = _juniorFormKey;
      widget = EmpDetailPage(
        personId: currentPageIndex,
        formKey: _formKey,
        key: ValueKey(currentPageIndex),
        employeeType: EmployeeType.junir,
        nextButtonCallback: nextButtonCallback,
      );
    }
    return widget;
  }

  void nextButtonCallback(isValidate) {
    print(isValidate);
    if (isValidate) {
      _changePage(true);
    }
  }
}
