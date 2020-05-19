import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutterappunittest/common/enums.dart';
import 'package:flutterappunittest/entity/country_data.dart';
import 'package:flutterappunittest/common/colors.dart';
import 'package:flutterappunittest/common/theme_dimensions.dart';
import 'package:flutterappunittest/common/theme_helper.dart';

class EmpDetailPage extends StatefulWidget {
  final EmployeeType employeeType;
  final int personId;
  final ValueChanged nextButtonCallback;
  final GlobalKey<FormState> formKey;

  EmpDetailPage(
      {Key key,
      this.employeeType,
      this.personId,
      this.nextButtonCallback,
      this.formKey})
      : super(key: key);

  @override
  _EmpDetailPageState createState() => _EmpDetailPageState();
}

class _EmpDetailPageState extends State<EmpDetailPage> {
  final Map<int, Widget> childrenSlidingSegmentedControl = const <int, Widget>{
    0: Text('Male'),
    1: Text('Female'),
  };

  TextEditingController _nameController;
  TextEditingController _familyNameController;

  GlobalKey<FormState> _formKey;

  FocusNode _nameFN, _familyFN;

  String firstName, lastName;
  String nationality = "";
  Countries dropDownValue;
  int sequenceCount = 1;
  List<Countries> nationalityList = List();

  @override
  void initState() {
    _nameController = TextEditingController();
    _familyNameController = TextEditingController();

    _nameFN = FocusNode();
    _familyFN = FocusNode();

    //Hide keyboard initially
    SystemChannels.textInput.invokeMethod('TextInput.hide');

    _formKey = GlobalKey<FormState>();

    _formKey = widget.formKey;

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _familyNameController.dispose();

    _nameFN.dispose();
    _familyFN.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Theme(
        data: ThemeData(primaryColor: kColorBlack),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(ThemeDimension.paddingSmall),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: _givenNameWidget(),
                        )
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: _familyNameWidget(),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: widget.employeeType == EmployeeType.senior
                              ? Container()
                              : _juniorWidget(),
                        ),
                      ],
                    ),
                    ThemeHelper.paddingTop(),
                  ],
                ),
              ),
            ),
            ThemeHelper.paddingTop(),
            _nextButtonWidget(),
          ],
        ),
      ),
    );
  }

  Widget _givenNameWidget() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      style: ThemeHelper.textFormFieldStyle(context),
      controller: _nameController,
      focusNode: _nameFN,
      inputFormatters: [WhitelistingTextInputFormatter(RegExp("[a-zA-Z -]"))],
      onChanged: (value) {
        _setState();
      },
      showCursor: true,
      validator: (value) {
        if (value.isEmpty) return "Minimum 2 letters allowed";
        if (value.length < 2) return "Minimum 2 letters allowed";
        return null;
      },
      onFieldSubmitted: (value) {
        /// Moved to next field
        _onFocusChange(_nameFN, _familyFN);
      },
      decoration: ThemeHelper.textFieldInputDecoration(context, "First Name",
          editTextValue: _nameController.text,
          hasFocus: _nameFN.hasFocus, onCancelClick: () {
        setState(() {
          _nameController.clear();
          _setState();
        });
      }),
    );
  }

  Widget _familyNameWidget() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      style: ThemeHelper.textFormFieldStyle(context),
      controller: _familyNameController,
      focusNode: _familyFN,
      inputFormatters: [WhitelistingTextInputFormatter(RegExp("[a-zA-Z -]"))],
      validator: (value) {
        if (value.isEmpty) return "Minimum 2 letters allowed";
        if (value.length < 2) return "Minimum 2 letters allowed";
        return null;
      },
      onTap: () {},
      onChanged: (value) {
        _setState();
      },
      onFieldSubmitted: (value) {},
      decoration: ThemeHelper.textFieldInputDecoration(context, "FamilyName",
          editTextValue: _familyNameController.text,
          hasFocus: _familyFN.hasFocus, onCancelClick: () {
        _familyNameController.clear();
        _setState();
      }),
    );
  }

  Widget _juniorWidget() {
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      child: FlatButton(
        color: kColorGrey7,
        textColor: Colors.white,
        disabledColor: kColorGrey7,
        disabledTextColor: Colors.black,
        padding: EdgeInsets.all(8.0),
        splashColor: kColorGrey7,
        child: Row(
          children: <Widget>[
            ThemeHelper.paddingLeftTiny(),
            Text(
              "Junior Developer",
              style: TextStyle(color: kColorOrangeLight),
            ),
          ],
        ),
        onPressed: () {},
      ),
    );
  }

  void _onFocusChange(FocusNode currentFN, FocusNode nextFN) {
    currentFN.unfocus();
    FocusScope.of(context).requestFocus(nextFN);
  }

  Widget _nextButtonWidget() {
    return Opacity(
      opacity: 1.0,
      child: InkWell(
        child: Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Center(
            child: Container(
              height: 72.0,
              width: 72.0,
              decoration: BoxDecoration(
                color: kColorPrimary,
                shape: BoxShape.circle,
              ),
              padding: EdgeInsets.all(15.0),
              child: Center(
                child: Text(
                  'Next',
                  style: TextStyle(
                    color: kColorOrangeLight,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
          ),
        ),
        onTap: () {
          if (_formKey.currentState.validate()) {
            widget.nextButtonCallback(_formKey.currentState.validate());
            _setDefaultValue();
            _formKey.currentState.reset();
          }
        },
      ),
    );
  }

  void _setDefaultValue() {
    _nameController.clear();
    _familyNameController.clear();
    _removeFocusFromAllWidget();
    _setState();
  }

  String getEmployeeType(EmployeeType empType) {
    switch (empType) {
      case EmployeeType.senior:
        "Senior";
        break;
      case EmployeeType.junir:
        "Junior";
        break;
    }
    return "";
  }

  void _setState() {
    setState(() {});
  }

  void _removeFocusFromAllWidget() {
    FocusScope.of(context).requestFocus(new FocusNode());
  }
}
