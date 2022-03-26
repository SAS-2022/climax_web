import 'package:climax_web_page/services/constants.dart';
import 'package:climax_web_page/services/dropdownLists.dart';
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
  bool _isSending = false;
  TextEditingController _controllerName = TextEditingController();
  TextEditingController _controllerPhone = TextEditingController();
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerCountry = TextEditingController();
  TextEditingController _controllerCity = TextEditingController();
  TextEditingController _controllerWorkType = TextEditingController();
  TextEditingController _controllerMessage = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controllerCountry.text = CountryList.countries().first;
    _controllerWorkType.text = WorkType.types().first;
  }

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: SizedBox(
            width: _size.width - 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
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
                      height: _size.height,
                      width: _size.width / 3,
                      child: Stack(
                        children: [
                          Column(
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
                                  textCapitalization:
                                      TextCapitalization.sentences,
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0)),
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0)),
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
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
                                  onSaved: (val) {
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
                                    label: Text('Mobile Number',
                                        style: textStyle1),
                                    hintText: 'Any number we can reach you at',
                                    hintStyle: textStyle2,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    enabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0)),
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0)),
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
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
                                  onSaved: (val) {
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
                                    label: Text('Email Address',
                                        style: textStyle1),
                                    hintText: 'So we can communicate',
                                    hintStyle: textStyle2,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    enabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0)),
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0)),
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
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
                                  onSaved: (val) {
                                    _controllerEmail.text = val.toString();
                                  },
                                ),
                              ),
                              //client location country, city
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50.0,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField<String>(
                                      decoration:
                                          const InputDecoration.collapsed(
                                              hintText: ''),
                                      isDense: true,
                                      isExpanded: true,
                                      value: _controllerCountry.text.toString(),
                                      hint: const Center(
                                          child: Text('Select Country')),
                                      onChanged: (String? val) {
                                        setState(() {
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());
                                          _controllerCountry.text = val!;
                                        });
                                      },
                                      validator: (val) => val == null
                                          ? 'Please select country'
                                          : null,
                                      selectedItemBuilder:
                                          (BuildContext context) {
                                        return CountryList.countries()
                                            .map<Widget>((String item) {
                                          return Center(
                                            child: Text(
                                              item,
                                              style: textStyle1,
                                            ),
                                          );
                                        }).toList();
                                      },
                                      items: CountryList.countries()
                                          .map((String item) {
                                        return DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(item),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                              //type of work required
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50.0,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButtonFormField<String>(
                                      decoration:
                                          const InputDecoration.collapsed(
                                              hintText: ''),
                                      isDense: true,
                                      isExpanded: true,
                                      hint: const Center(
                                          child: Text('Select Type of Work')),
                                      value:
                                          _controllerWorkType.text.toString(),
                                      onChanged: (String? val) {
                                        setState(() {
                                          FocusScope.of(context)
                                              .requestFocus(FocusNode());
                                          _controllerWorkType.text = val!;
                                        });
                                      },
                                      validator: (val) => val == null
                                          ? 'Please select work type'
                                          : null,
                                      selectedItemBuilder:
                                          (BuildContext context) {
                                        return WorkType.types()
                                            .map<Widget>((String item) {
                                          return Center(
                                            child: Text(
                                              item,
                                              style: textStyle1,
                                            ),
                                          );
                                        }).toList();
                                      },
                                      items:
                                          WorkType.types().map((String item) {
                                        return DropdownMenuItem<String>(
                                          value: item,
                                          child: Text(item),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),

                              //client message
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                  controller: _controllerMessage,
                                  autofocus: false,
                                  keyboardType: TextInputType.text,
                                  maxLines: 5,
                                  maxLength: 250,
                                  decoration: InputDecoration(
                                    label: Text('Client Message',
                                        style: textStyle1),
                                    hintText: 'Let us know how we can help',
                                    hintStyle: textStyle2,
                                    filled: true,
                                    fillColor: Colors.grey[100],
                                    enabledBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0)),
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                    focusedBorder: const OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15.0)),
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                  ),
                                  validator: (val) {
                                    if (val!.isEmpty) {
                                      return 'Please let us know what you require';
                                    }
                                    if (val.length < 30) {
                                      return 'Can you tell us more so we can help you properly';
                                    }
                                    return null;
                                  },
                                  onSaved: (val) {
                                    _controllerMessage.text = val.toString();
                                  },
                                ),
                              ),
                              //Submit form
                              Container(
                                  width: _size.width,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.grey[600],
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        _formKey.currentState!.save();

                                        setState(() {
                                          _isSending = true;
                                        });

                                        print('we are sending the message now');
                                      }
                                    },
                                    child: Text('Submit Request',
                                        style: textStyle3),
                                  )),
                            ],
                          ),
                          _isSending
                              ? const Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.orangeAccent),
                                )
                              : const SizedBox.shrink()
                        ],
                      ),
                    )
                  ],
                ),
                //Contact information
                SizedBox(
                  width: _size.width / 2 - 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'You can also contact us at:',
                          style: textStyle4,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Contact: Ragheb Daou',
                          style: textStyle2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Mobile: +961 3324127',
                          style: textStyle2,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Email: ccs.org@hotmail.com',
                          style: textStyle2,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Opening hours: ',
                        style: textStyle4,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Monday - Friday: 9 am to 5 pm',
                          style: textStyle2,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Saturday: 10 am to 4 pm',
                          style: textStyle2,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'We are closed on Sundays',
                          style: textStyle2,
                        ),
                      ),
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
