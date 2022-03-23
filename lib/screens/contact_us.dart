import 'package:climax_web_page/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class ContactUs extends StatefulWidget {
  const ContactUs({Key? key}) : super(key: key);

  @override
  State<ContactUs> createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  late Size _size;
  final _formKey = GlobalKey<FormState>();
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerCountry = TextEditingController();
  TextEditingController _controllerCity = TextEditingController();
  TextEditingController _controllerWorkType = TextEditingController();
  TextEditingController _controllerMessage = TextEditingController();
  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SizedBox(
            width: _size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                //The following form will allow clients to contact us by sending a direct email
                Text(
                  '''
We are looking forward to hearing from you, please don't hesistate in contacting us.

''',
                  style: Theme.of(context).textTheme.bodyText1,
                ),

                SizedBox(
                  height: 2 * _size.height / 3,
                  width: _size.width / 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //Client name
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: _controllerName,
                          autofocus: false,
                          textCapitalization: TextCapitalization.sentences,
                          decoration: InputDecoration(
                            label: Text(
                              'Full Name',
                              style: textStyle1,
                            ),
                            hintText: 'What should we call you',
                            hintStyle: textStyle2,
                            filled: true,
                            fillColor: Colors.grey[100],
                            enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.blue)),
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Name cannot be empty';
                            }
                            if (val.length < 3) {
                              return 'Name is too short';
                            }
                            return null;
                          },
                          onChanged: (val) {
                            _controllerName.text = val.toString();
                          },
                        ),
                      ),
                      //client mobile number
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: _controllerPhone,
                          autofocus: false,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            label: Text('Mobile Number', style: textStyle1),
                            hintText: 'Any number we can reach you at',
                            hintStyle: textStyle2,
                            filled: true,
                            fillColor: Colors.grey[100],
                            enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.blue)),
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Phone number cannot be empty';
                            }
                            if (val.length < 7) {
                              return 'Phone number is not valid';
                            }
                            return null;
                          },
                          onChanged: (val) {
                            _controllerPhone.text = val.toString();
                          },
                        ),
                      ),
                      //client email address
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: _controllerEmail,
                          autofocus: false,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            label: Text('Email Address', style: textStyle1),
                            hintText: 'So we can communicate',
                            hintStyle: textStyle2,
                            filled: true,
                            fillColor: Colors.grey[100],
                            enabledBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.grey)),
                            focusedBorder: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15.0)),
                                borderSide: BorderSide(color: Colors.blue)),
                          ),
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Email cannot be empty';
                            }
                            if (!EmailValidator.validate(val)) {
                              return 'Email is not valid';
                            }
                            return null;
                          },
                          onChanged: (val) {
                            _controllerEmail.text = val.toString();
                          },
                        ),
                      ),
                      //client location country, city

                      //type of work required

                      //client message
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
